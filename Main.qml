import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    minimumWidth: 400
    minimumHeight: 450


    Rectangle {
        id: rect
        width: parent.width * 0.2 // 20% от ширины окна
        height: parent.height * 0.8 // 80% от высоты окна
        anchors.centerIn: parent
        color: "lightgrey"

        Rectangle {
            id: rect_red
            width: parent.width*0.8 // 80% от ширины светофора
            height: parent.height * 0.33 // 1/3 высоты светофора
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            border.color: "white" // Цвет границы
            border.width: 2
            NumberAnimation on x { from:10; to: 240; duration: 4000}

        }

        Rectangle {
            id: rect_yellow
            width: parent.width * 0.8 // 80% от ширины светофора
            height: parent.height * 0.33 // 1/3 высоты светофора
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rect_red.bottom
            border.color: "white" // Цвет границы
            border.width: 2
        }

        Rectangle {
            id: rect_green
            width: parent.width * 0.8 // 80% от ширины светофора
            height: parent.height * 0.33 // 1/3 высоты светофора
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rect_yellow.bottom
            border.color: "white" // Цвет границы
            border.width: 2
        }


        states:[
                    State {
                        name: "stop"
                        PropertyChanges {target: rect_red; color: "red"}
                        PropertyChanges {target:rect_yellow; color: "black"}
                        PropertyChanges {target:rect_green; color: "black"}
                    },
                    State {
                        name: "caution"
                        PropertyChanges {target: rect_red; color: "black"}
                        PropertyChanges {target:rect_yellow; color: "yellow"}
                        PropertyChanges {target:rect_green; color: "black"}
                    },
                    State {
                        name: "go"
                        PropertyChanges {target: rect_red; color: "black"}
                        PropertyChanges {target:rect_yellow; color: "black"}
                        PropertyChanges {target:rect_green; color: "green"}
                    } ]
            state: "go"

            transitions:[
                Transition {
                from: "stop"
                to: "caution"
                ColorAnimation { target: rect_red; duration: 500; property: "color" }
                ColorAnimation { target: rect_yellow; duration: 500; property: "color" }
                ColorAnimation { target: rect_green; duration: 500; property: "color" }},

                Transition {
                from: "caution"
                to: "go"
                ColorAnimation { target: rect_red; duration: 500; property: "color" }
                ColorAnimation { target: rect_yellow; duration: 500; property: "color" }
                ColorAnimation { target: rect_green; duration: 500; property: "color" }},

                Transition {
                from: "go"
                to: "stop"
                ColorAnimation { target: rect_red; duration: 500; property: "color" }
                ColorAnimation { target: rect_yellow; duration: 500; property: "color" }
                ColorAnimation { target: rect_green; duration: 500; property: "color" }}
            ]

    }
    MouseArea{
        anchors.fill:parent
        onClicked: {
            if (rect.state == "stop") {
                rect.state = "caution";
            } else if (rect.state == "caution") {
                rect.state = "go";
            } else {
                rect.state = "stop";
            }
        }
    }
}
