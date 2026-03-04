param(
    [string]$ShortcutName = "Spotify Hotkeys.lnk"
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$startupDir = [Environment]::GetFolderPath("Startup")
$shortcutPath = Join-Path $startupDir $ShortcutName

if (Test-Path $shortcutPath) {
    Remove-Item $shortcutPath -Force
    Write-Host "Autostart disabled: $shortcutPath" -ForegroundColor Green
} else {
    Write-Host "Shortcut not found: $shortcutPath" -ForegroundColor Yellow
}
