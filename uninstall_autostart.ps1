param(
    [string]$ShortcutName = "Spotify Hotkeys.lnk"
)

$startupDir = [Environment]::GetFolderPath("Startup")
$shortcutPath = Join-Path $startupDir $ShortcutName

if (Test-Path $shortcutPath) {
    Remove-Item $shortcutPath -Force
    Write-Host "Автозапуск отключен: $shortcutPath"
} else {
    Write-Host "Ярлык автозапуска не найден: $shortcutPath"
}
