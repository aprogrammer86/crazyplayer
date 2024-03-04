#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "playercontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // app.setWindowIcon(QIcon(":/CrazyPlayer/path/to/app/icon")); //here we should add module name before file physical address

    QQmlApplicationEngine engine;
    PlayerController playerController(&app);
    qmlRegisterSingletonInstance("com.company.PlayerController", 1, 0, "PlayerController", &playerController);

    const QUrl url(u"qrc:/CrazyPlayer/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
