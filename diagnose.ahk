#Requires AutoHotkey v2.0

MsgBox("Активируйте окно Spotify, затем нажмите OK")

Sleep(500)

spotifyHwnd := WinGetID("A")
MsgBox("Window ID: " spotifyHwnd)
