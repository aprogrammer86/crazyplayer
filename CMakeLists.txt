cmake_minimum_required(VERSION 3.16)

project(CrazyPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
message("CMAKE_PREFIX_PAThhhH" ${CMAKE_PREFIX_PATH})
find_package(Qt6 6.2 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup()

qt_add_executable(appCrazyPlayer
    main.cpp
)


# set(CMAKE_AUTORCC ON) IF WE WANT TO RESOURCE MANAGMENT BY qml.qrc

qt_add_qml_module(appCrazyPlayer
    URI CrazyPlayer
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES ButtonImage.qml
    QML_FILES AudioInfoBox.qml

    SOURCES playercontroller.h playercontroller.cpp

    RESOURCES
    assets/icons/pause-circle.svg
    assets/icons/play-circle.svg
    assets/icons/skip-backward-circle.svg
    assets/icons/skip-forward-circle.svg

    assets/images/albums/astane_janan.png
    assets/images/albums/bidad.png
    assets/images/albums/zemestan.jpg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCrazyPlayer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCrazyPlayer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCrazyPlayer
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appCrazyPlayer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
