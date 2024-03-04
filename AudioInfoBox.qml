import QtQuick
import com.company.PlayerController

Item {
    id: root

    required property int songIndex
    property alias trackName: trackText.text
    property alias albumName: albumText.text
    property alias imageSource: albumImage.source

    visible: PlayerController.currentSongIndex === root.songIndex

    Image {
        id: albumImage

        mipmap: true

        sourceSize.width: 150
        sourceSize.height: 150

        width: 150
        height: 150

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
    }

    Text {
        id: trackText
        text: qsTr("Audio Name Audio Name Audio Name Audio Name")
        width: 150
        color: "white"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        font {
            pixelSize: 20
            bold: true
            italic: true
        }


        anchors{
            bottom: parent.verticalCenter
            left: albumImage.right
            right: parent.right
            margins: 20
        }
    }

    Text {
        id: albumText
        text: qsTr("Album Name Album Name Album Name Album Name")
        width: 150
        color: "grey"

        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        font {
            pixelSize: 20
            bold: true
            italic: true
        }

        anchors{
            top: parent.verticalCenter
            left: albumImage.right
            right: parent.right
            margins: 20
        }
    }
}
