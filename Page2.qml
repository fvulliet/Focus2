import QtQuick

Item {
    id: root

    Column {
        id: column
        anchors.fill: parent
        spacing: 10

        // The Repeater itself doesn’t handle focus;
        // you need to ensure each item created by the Repeater is focusable and manage the focus navigation manually.
        Repeater {
            id: repeater
            model: 10
            delegate: MyTextInput {
                id: firstName
                width: column.width
                height: 50
                label: modelData
                focus: index === 5  // Set focus to the 3rd item initially
                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Down) {
                        // Move focus to the next item
                        var nextIndex = (index + 1) % repeater.count;
                        repeater.itemAt(nextIndex).forceActiveFocus();
                        event.accepted = true;
                    } else if (event.key === Qt.Key_Up) {
                        // Move focus to the previous item
                        var prevIndex = (index - 1 + repeater.count) % repeater.count;
                        repeater.itemAt(prevIndex).forceActiveFocus();
                        event.accepted = true;
                    }
                }
            }
        }
    }
}
