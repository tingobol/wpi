# List of file URLs to download
$Urls = @(
    "https://download.anydesk.com/AnyDesk.exe",
    "https://github.com/tingobol/wpi/raw/main/WinRar/winrar-x64-624es.exe",
	"https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BD5CE696E-242A-0F7E-D4EF-BC1A4034EFAC%7D%26lang%3Des%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/chrome/install/ChromeStandaloneSetup64.exe",
	"https://github.com/tingobol/wpi/raw/main/Firefox/Firefox Setup 123.0.1.exe",
   	"https://www.7-zip.org/a/7z2401-x64.exe",
	"https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe",
	""

	
	)
 
# Destination folder
$DestinationFolder = "C:\temp\"
 
# Ensure the destination folder exists
If (-not (Test-Path $DestinationFolder)) {
    New-Item -Path $DestinationFolder -ItemType Directory
}
 
# Download each file
$TotalUrls = $urls.Count
$Counter = 0
ForEach($URL in $Urls)
{
    $FileName = [System.IO.Path]::GetFileName($url)  
    # Extract file name from URL
    $DestinationPath = Join-Path -Path $DestinationFolder -ChildPath $FileName
 
    # Display main progress
    Write-Progress -Activity "Downloading files ($($Counter+1) of $TotalUrls)" -Status ("Downloading " + $FileName) -PercentComplete (($Counter / $TotalUrls) * 100)
 
    # Download file with sub-progress bar for individual file download
    Invoke-WebRequest -Uri $url -OutFile $destinationPath
    $Counter++
}
 
Write-Progress -Activity "Downloading files" -Completed -Status "All files downloaded!"
Write-Host "All files downloaded successfully!" -ForegroundColor Green
