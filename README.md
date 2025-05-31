<H1>winget</H1> is the Windows Package Manager — a command-line tool developed by Microsoft that lets you install, update, and manage software on Windows easily, much like apt on Linux or brew on macOS. <br> <br>
https://learn.microsoft.com/windows/package-manager/winget/#install-winget-on-windows-sandbox <br> <br>
Not Supported: Server 2019 <br>
Experimental: Server 2022 <br>
Public preview: Server 2025 <br>
<hr>

Tells PowerShell to ignore the current script execution policy for that specific session: `PowerShell -ExecutionPolicy Bypass` <br>
Install apps from the CMD/PowerShell: `winget install appname`


2025: <br> 
issues with a brand new out-of-the-box system with Win11. <br>
Winget is broken out of the gate and none of these separate methods of installing/updating it work. 

Solution: <br>
`Install-Module -Name Microsoft.WinGet.Client`<br>
`Repair-WinGetPackageManager -Force -Latest`

