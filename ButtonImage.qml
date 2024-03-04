import QtQuick

Image{
    id: root

    signal clicked()

    sourceSize.width: parent.width
    sourceSize.height: parent.height

    opacity: if(mouseArea.containsPress){
                 return 1
             }else if(mouseArea.containsMouse){
                 return 0.5
             }else{
                 return 1
             }

    // mipmap: false //if the images are not svg

    MouseArea{
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true

        onClicked: () => root.clicked()
    }
}
