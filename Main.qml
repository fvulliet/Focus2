import QtQuick

Window {
    width: 600
    height: 800
    visible: true
    title: qsTr("A demo to demonstrate the sake of FocusScope")

    Column {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        onActiveFocusChanged: console.log("-----main column activeFocus", activeFocus)

        Row {
            id: header
            objectName: "header"
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: 10
            }
            height: 50
            spacing: 10

            onActiveFocusChanged: console.log("-----", objectName, activeFocus)

            Rectangle {
                height: parent.height
                width: basic.implicitWidth
                radius: 10
                border.width: loader.source == "Page1.qml" ? 3 : 1

                Item {
                    id: basic
                    height: parent.height
                    implicitWidth: basicText.implicitWidth + 10

                    Text {
                        id: basicText
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: "basic"
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: loader.source = "Page1.qml"
                }
            }

            Rectangle {
                height: parent.height
                width: repeater.implicitWidth
                radius: 10
                border.width: loader.source == "Page2.qml" ? 3 : 1

                Item {
                    id: repeater
                    height: parent.height
                    implicitWidth: repeaterText.implicitWidth + 10

                    Text {
                        id: repeaterText
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: "repeater"
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        loader.source = "Page2.qml"
                    }
                }
            }
        }

        Item {
            objectName: "contentItem"
            width: parent.width
            height: parent.height - header.height

            onActiveFocusChanged: console.log("-----", objectName, activeFocus)

            // Loader is a focus scope. Its focus property must be set to true for any
            // of its children to get the active focus.
            Loader {
                id: loader
                anchors {
                    fill: parent
                    margins: 10
                }
                source: "Page1.qml"
                onLoaded: forceActiveFocus() // give the focus to the loaded item
            }
        }
    }
}
