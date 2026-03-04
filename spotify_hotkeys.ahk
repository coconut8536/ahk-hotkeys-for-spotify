#Requires AutoHotkey v2.0
#SingleInstance Force

A_IconTip := "Spotify Dedicated Hotkeys"

A_TrayMenu.Delete()
A_TrayMenu.Add("Reload", (*) => Reload())
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_TrayMenu.Default := "Reload"

^+Up::Spotify_Control(14)
^+Right::Spotify_Control(11)
^+Left::Spotify_Control(12)

Spotify_Control(cmdId) {
    spotifyHwnd := WinExist("ahk_exe Spotify.exe")

    if !spotifyHwnd {
        TrayTip("Spotify", "Spotify не запущен", 2)
        return
    }

    lParam := (cmdId << 16) | 0
    PostMessage(0x0319, spotifyHwnd, lParam)
}
