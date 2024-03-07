# List of file URLs to download
$Urls = @(
    "https://download.anydesk.com/AnyDesk.exe",
    "https://github.com/tingobol/wpi/raw/main/WinRar/winrar-x64-624es.exe"
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
    $FileName = [System.IO.Path]::GetFileName($url)  # Extract file name from URL
    $DestinationPath = Join-Path -Path $DestinationFolder -ChildPath $FileName
 
    # Display main progress
    Write-Progress -Activity "Downloading files ($($Counter+1) of $TotalUrls)" -Status ("Downloading " + $FileName) -PercentComplete (($Counter / $TotalUrls) * 100)
 
    # Download file with sub-progress bar for individual file download
    Invoke-WebRequest -Uri $url -OutFile $destinationPath
    $Counter++
}
 
Write-Progress -Activity "Downloading files" -Completed -Status "All files downloaded!"
Write-Host "All files downloaded successfully!" -ForegroundColor Green
