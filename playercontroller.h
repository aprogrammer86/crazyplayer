#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

#include <QMediaPlayer>
#include <QObject>

class PlayerController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int lastSongIndex READ lastSongIndex CONSTANT FINAL)
    Q_PROPERTY(int currentSongIndex READ currentSongIndex NOTIFY currentSongIndexChanged FINAL)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged FINAL)

public:
    explicit PlayerController(QObject *parent = nullptr);

    bool playing() const;

    int lastSongIndex() const;

    int currentSongIndex() const;

public slots:
    void switchToNextSong();
    void switchToPrevSong();
    void playPause();
    void onMediaStatusChanged(QMediaPlayer::MediaStatus status);

signals:
    void playingChanged();
    void currentSongIndexChanged();

private:
    bool m_playing = false;
    int m_lastSongIndex = 2;
    int m_currentSongIndex = 0;
    QMediaPlayer m_mediaPlayer;
};

#endif // PLAYERCONTROLLER_H
