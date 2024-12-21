import QtQuick
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 400
    height: 500
    visible: true
    title: "Калькулятор"

    SwipeView {
        id: view
        currentIndex: 1
        anchors.fill: parent
            Item {
                id: firstPage
                Rectangle {
                    anchors.fill: parent
                    color: "green" // Пример цвета для второй страницы
                }
            }
            Item {
                id: secondPage
                Rectangle {
                    anchors.fill: parent
                    color: "yellow" // Пример цвета для второй страницы
                }
            }
            Item {
                id: thirdPage
                Rectangle {
                    anchors.fill: parent
                    color: "red" // Пример цвета для второй страницы
                }
            }
    }
    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
