param(
    [string]$ShortcutName = "Spotify Hotkeys.lnk"
)

$ErrorActionPreference = "Stop"

$scriptPath = Join-Path $PSScriptRoot "spotify_hotkeys.ahk"
if (-not (Test-Path $scriptPath)) {
    throw "Не найден скрипт: $scriptPath"
}

$startupDir = [Environment]::GetFolderPath("Startup")
$shortcutPath = Join-Path $startupDir $ShortcutName

$ahkCandidates = @(
    (Join-Path $Env:ProgramFiles "AutoHotkey\v2\AutoHotkey64.exe"),
    (Join-Path $Env:ProgramFiles "AutoHotkey\AutoHotkey64.exe"),
    (Join-Path $Env:ProgramFiles "AutoHotkey\AutoHotkey.exe")
)

$ahkExe = $ahkCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)

if ($ahkExe) {
    $shortcut.TargetPath = $ahkExe
    $shortcut.Arguments = "`"$scriptPath`""
}
else {
    $shortcut.TargetPath = $scriptPath
}

$shortcut.WorkingDirectory = $PSScriptRoot
$shortcut.IconLocation = "$env:SystemRoot\System32\SndVol.exe,0"
$shortcut.Description = "Spotify dedicated global hotkeys"
$shortcut.Save()

Write-Host "Автозапуск включен: $shortcutPath"
