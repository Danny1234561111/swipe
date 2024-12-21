import QtQuick
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
            width: parent.width * 0.8 // 80% от ширины светофора
            height: height * 0.33 // 1/3 высоты светофора
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }

        Rectangle {
            id: rect_yellow
            width: parent.width * 0.8 // 80% от ширины светофора
            height: height * 0.33 // 1/3 высоты светофора
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rect_red.bottom
        }

        Rectangle {
            id: rect_green
            width: parent.width * 0.8 // 80% от ширины светофора
            height: height * 0.33 // 1/3 высоты светофора
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rect_yellow.bottom
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (rect.state === "stop") {
                    rect.state = "caution";
                } else if (rect.state === "caution") {
                    rect.state = "go";
                } else {
                    rect.state = "stop";
                }
            }
        }

        // Установка начального состояния
        states: [
            State {
                name: "stop"
                PropertyChanges { target: rect_red; color: "red" }
                PropertyChanges { target: rect_yellow; color: "gray" }
                PropertyChanges { target: rect_green; color: "gray" }
            },
            State {
                name: "caution"
                PropertyChanges { target: rect_red; color: "gray" }
                PropertyChanges { target: rect_yellow; color: "yellow" }
                PropertyChanges { target: rect_green; color: "gray" }
            },
            State {
                name: "go"
                PropertyChanges { target: rect_green; color: "green" }
                PropertyChanges { target: rect_red; color: "gray" }
                PropertyChanges { target: rect_yellow; color: "gray" }
            }
        ]

        // Установка начального состояния
        Component.onCompleted: {
            rect.state = "stop"; // Устанавливаем начальное состояние
        }
    }
}
