import QtQuick

Column {
    id: root
    objectName: "page1's column"
    spacing: 10

    // Any key events received in the loaded item should likely also be accepted so they
    // are not propagated to the Loader.
    Keys.onPressed: (event)=> {
        console.log("KeyReader captured:", event.text);
        event.accepted = true;
    }

    onActiveFocusChanged: console.log("-----", objectName, activeFocus)

    Text {
        id: header
        width: parent.width
        height: parent.height / 10
        font.pixelSize: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: "Use up and down to navigate"
    }

    MyTextInput {
        id: firstName
        objectName: "firstName"
        width: parent.width
        height: parent.height / 10
        label: "First Name"
        focus: true
        KeyNavigation.up: age
        KeyNavigation.down: lastName

        onActiveFocusChanged: console.log("-----", objectName, activeFocus)
    }

    MyTextInput {
        id: lastName
        objectName: "LastName"
        width: parent.width
        height: parent.height / 10
        label: "Last Name"
        KeyNavigation.up: firstName
        KeyNavigation.down: age

        onActiveFocusChanged: console.log("-----", objectName, activeFocus)
    }

    MyTextInput {
        id: age
        objectName: "age"
        width: parent.width
        height: parent.height / 10
        label: "Age"
        KeyNavigation.up: lastName
        KeyNavigation.down: firstName

        onActiveFocusChanged: console.log("-----", objectName, activeFocus)
    }
}



