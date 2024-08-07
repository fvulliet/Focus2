import QtQuick

FocusScope {
//Item {
    id: root

    property alias label: inputLabelTxt.text
    property alias content: inputContent.text

    Row {
        anchors.fill: parent
        spacing: 10

        Item {
            id: inputLabel
            objectName: "MyTextInput's input label"
            height: parent.height
            width: 2*height

            onActiveFocusChanged: console.log("-----", objectName, activeFocus)

            Text {
                id: inputLabelTxt
                anchors.fill: parent
                font {
                    pixelSize: height / 3
                }
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            }
        }

        Rectangle {
            id: innerRect
            objectName: "MyTextInput's innerRect"
            height: parent.height
            width: parent.width - inputLabel.width - parent.spacing
            border {
                color: inputContent.activeFocus ? "blue" : "lightblue"
                width: inputContent.activeFocus ? 4 : 2
            }
            color: inputContent.activeFocus ? "lightblue" : "transparent"
            radius: 5

            onActiveFocusChanged: console.log("-----", objectName, activeFocus)

            TextInput {
                id: inputContent
                objectName: "MyTextInput's textinput"
                anchors {
                    fill: parent
                    margins: 10
                }
                font.bold: activeFocus
                font.pixelSize: height / 2
                verticalAlignment: Text.AlignVCenter
                cursorVisible: activeFocus
                activeFocusOnPress: false
                focus: true

                onActiveFocusChanged: console.log("-----", objectName, activeFocus)
            }
        }
    }
}
