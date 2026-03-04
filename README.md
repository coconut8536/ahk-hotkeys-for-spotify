# Spotify Global Hotkeys (Windows)

Глобальные горячие клавиши для управления Spotify, даже когда Spotify не в фокусе.
Команды отправляются адресно в окно `Spotify.exe`, а не в системную активную медиасессию.

## Что делает

- `Ctrl + Shift + Up` — Play/Pause
- `Ctrl + Shift + Right` — Next track
- `Ctrl + Shift + Left` — Previous track

Видео и другой звук на компьютере не должны переключаться этими хоткеями.

## Требования

- Windows
- AutoHotkey v2: https://www.autohotkey.com/

## Запуск

1. Установите AutoHotkey v2.
2. Запустите `spotify_hotkeys.ahk` двойным кликом.
3. В трее появится скрипт. Через меню доступны `Reload` и `Exit`.

## Автозапуск при входе в Windows

Из папки `AHK` выполните PowerShell:

```powershell
.\install_autostart.ps1
```

Отключить автозапуск:

```powershell
.\uninstall_autostart.ps1
```

## Изменение горячих клавиш

Откройте файл `spotify_hotkeys.ahk` в текстовом редакторе и найдите эти строки (примерно в начале):

```ahk
^+Up::Spotify_PlayPause()
^+Right::Spotify_Next()
^+Left::Spotify_Previous()
```

Замените сочетания на удобные вам. Синтаксис:
- `^` — Ctrl
- `+` — Shift
- `!` — Alt
- `#` — Win
- `Up`, `Down`, `Left`, `Right` — стрелки
- `Home`, `End`, `PageUp`, `PageDown` — служебные клавиши

**Примеры:**
```ahk
NumpadOem_Plus::Spotify_PlayPause()
NumpadEnd::Spotify_Next()
NumpadHome::Spotify_Previous()
```

После редактирования сохраните файл и нажмите «Reload» в меню трея.
