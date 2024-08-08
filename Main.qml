import QtQuick

Window {
    width: 600
    height: 800
    visible: true
    title: qsTr("A multi-pages demo to demonstrate the sake of FocusScope")

    property var tabs: [
        { url: "Page1.qml", text: "basic" },
        { url: "Page2.qml", text: "repeater" }
    ]

    Column {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 0

        Row {
            id: header
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: 10
            }
            height: 50
            spacing: 10

            Repeater {
                model: tabs
                delegate: Tab {
                    height: header.height
                    selected: loader.source == modelData.url
                    text: modelData.text
                    onClicked: loader.source = modelData.url
                }
            }
        }

        Item {
            width: parent.width
            height: parent.height - header.height

            // Loader is a focus scope. Its focus property must be set to true for any
            // of its children to get the active focus.
            Loader {
                id: loader
                anchors {
                    fill: parent
                    margins: 10
                }
                source: tabs[0].url
                onLoaded: forceActiveFocus() // give the focus to the loaded item
            }
        }
    }

    component Tab : Rectangle {
        id: root

        property bool selected
        property alias text: pageTitle.text

        signal clicked

        width: page.implicitWidth
        border.width: selected ? 3 : 1

        Item {
            id: page
            height: parent.height
            implicitWidth: pageTitle.implicitWidth + 10

            Text {
                id: pageTitle
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}



