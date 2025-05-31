# Install-Apps.ps1

$LogFile = "Install-Log.txt"
function Log {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $LogFile -Append -Encoding utf8
    Write-Output $message
}

function Install-App {
    param(
        [string]$AppName,
        [string]$WingetId
    )

    Log "Check if $AppName is installed..."
    $isInstalled = winget list --id $WingetId 2>$null | Select-String $WingetId

    if ($isInstalled) {
        Log "$AppName is already installed. Skipping."
    }
    else {
        Log "Installing $AppName..."
        $installResult = winget install --id=$WingetId --exact --accept-source-agreements --accept-package-agreements
        if ($LASTEXITCODE -eq 0) {
            Log "$AppName succesfully installed."
        }
        else {
            Log "❌ Installation $AppName unfinished:"
            Log $installResult
        }
    }
}

# Script
Log "`n--- Installation started: $(Get-Date) ---"

Install-App "Google Chrome" "Google.Chrome"
Install-App "Adobe Acrobat Reader" "Adobe.Acrobat.Reader.64-bit"
Install-App "VLC Media Player" "VideoLAN.VLC"
Install-App "7-Zip" "7zip.7zip"
Install-App "Mozilla.Firefox" "Mozilla.Firefox"
Install-App "FortiClient VPN" "Fortinet.FortiClientVPN" 
Install-App "Keepass" "DominikReichl.KeePass" 
Install-App "Microsoft Office (Microsoft 365)" "Microsoft.Office"
Install-App "Notepad++" "Notepad++"


Log "--- Installation finished ---`n"
