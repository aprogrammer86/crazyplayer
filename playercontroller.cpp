#include "playercontroller.h"
#include <QDebug>
#include <QAudioOutput>
#include <QMediaMetaData>
PlayerController::PlayerController(QObject *parent)
    : QObject{parent}, m_mediaPlayer{parent}
{
    m_mediaPlayer.setAudioOutput(new QAudioOutput());
    connect(&m_mediaPlayer, &QMediaPlayer::mediaStatusChanged, this, &PlayerController::onMediaStatusChanged);

}

bool PlayerController::playing() const
{
    return m_playing;
}

int PlayerController::lastSongIndex() const
{
    return m_lastSongIndex;
}

int PlayerController::currentSongIndex() const
{
    return m_currentSongIndex;
}

void PlayerController::switchToNextSong()
{
    if(m_currentSongIndex < m_lastSongIndex)
    {
        ++m_currentSongIndex;
    }
    else
    {
        m_currentSongIndex = 0;
    }
    emit currentSongIndexChanged();
}

void PlayerController::switchToPrevSong()
{
    if(m_currentSongIndex > 0)
    {
        --m_currentSongIndex;
    }
    else
    {
        m_currentSongIndex = m_lastSongIndex;
    }
    emit currentSongIndexChanged();
}

void PlayerController::playPause()
{
    m_mediaPlayer.setSource(QUrl::fromLocalFile("D:/Music/Mohammadreza Shajarian - Astane Janan/Mohammadreza Shajarian - 01. Pishdaramade Saranjam.mp3"));

    if(m_playing)
    {
        m_mediaPlayer.stop();
    }
    else
    {
        m_mediaPlayer.play();
    }
    m_playing = !m_playing;
    emit playingChanged();
}

void PlayerController::onMediaStatusChanged(QMediaPlayer::MediaStatus status)
{
    qDebug() << status;

    // if(status == QMediaPlayer::LoadedMedia)
    // {
    //     auto data = m_mediaPlayer.metaData();

    //     for(auto k:data.keys())
    //     {
    //         qDebug() << k << ": " << data.stringValue(k);
    //     }

    // }
}
