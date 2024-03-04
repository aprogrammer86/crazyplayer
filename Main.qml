import QtQuick
import com.company.PlayerController

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Crazy Player")

    Rectangle{
        id: headerArea

        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }

        // width: parent.width
        height: 50

        color: "grey"
    }

    Rectangle{
        id: mainArea

        anchors{
            top: headerArea.bottom
            bottom: footerArea.top
            left: parent.left
            right: parent.right
        }
        color: "black"

        AudioInfoBox {
            id: firstSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 0
            trackName: "Pishdaramad"
            albumName: "Astan Janan"
            imageSource: "assets/images/albums/astane_janan.png"
        }

        AudioInfoBox {
            id: secondSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 1
            trackName: "Pishdaramad"
            albumName: "Bidad"
            imageSource: "assets/images/albums/bidad.png"
        }

        AudioInfoBox {
            id: thirdSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 2
            trackName: "Pishdaramad"
            albumName: "Zemestan"
            imageSource: "assets/images/albums/zemestan.jpg"
        }
    }

    Rectangle{
        id: footerArea

        anchors{
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: 100

        color: "grey"

        Row {
            spacing: 20
            anchors.centerIn: parent

            ButtonImage {
                id: btnPrevIcon
                source: "assets/icons/skip-backward-circle.svg"

                width: 50
                height: 50

                onClicked: () => PlayerController.switchToPrevSong() //console.log("btnPrevIcon")

            }

            ButtonImage {
                id: btnPlayIcon
                source: PlayerController.playing ? "assets/icons/pause-circle.svg" : "assets/icons/play-circle.svg"

                width: 50
                height: 50

                onClicked: () => PlayerController.playPause()//console.log("btnPlayIcon")
            }

            ButtonImage {
                id: btnNextIcon
                source: "assets/icons/skip-forward-circle.svg"

                width: 50
                height: 50

                onClicked: () => PlayerController.switchToNextSong() //console.log("btnNextIcon")
            }
        }
    }

    // QtObject{
    //     id: PlayerController

    //     property int lastSongIndex: 2
    //     property int currentSongIndex: 0
    //     property bool playing: false

    //     function playPause(){
    //         playing = !playing
    //     }

    //     function nextSong(){
    //         if(currentSongIndex < lastSongIndex){
    //             ++currentSongIndex
    //         }else{
    //             currentSongIndex=lastSongIndex
    //         }
    //     }

    //     function prevSong(){
    //         if(currentSongIndex > 0){
    //             --currentSongIndex
    //         }else {
    //             currentSongIndex = 0
    //         }
    //     }
    // }
}
