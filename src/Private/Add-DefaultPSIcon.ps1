# Adds the PowerShell logo icon to the $HOME/.local/share/icons folder if it doesn't already exist
function Add-DefaultPSIcon {
    param ()
    if (!(Test-Path "$HOME/.local/share/icons/powershell-logo.png")) {
        if (!(Test-Path "$HOME/.local/share/icons")) {
            New-Item -ItemType Directory -Path "$HOME/.local/share/icons"
        }
        Copy-Item "$PSScriptRoot/../powershell-logo.png" "$HOME/.local/share/icons"
    }
}