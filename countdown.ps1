function Countdown-Timer {
param(
    [int]$Seconds = 60,
    [string]$AlarmSound = "./alarm-sounds/lamp_3.wav"
    )

  # check if the alarm sound file exists
  if (!(Test-Path -Path $AlarmSound)) {
    Write-Error "The specified alarm sound file '$AlarmSound' does not exist."
    return
  }

  # check for corret file type
  $supportedExtensions = @(".wav")
  $fileExtension = [System.IO.Path]::GetExtension($AlarmSound).ToLower()
  if ($fileExtension -notin $supportedExtensions) {
    Write-Error "Unsupported file format. Please provide a file with the following extension: $($supportedExtensions)"
    return
  }

  # calculate time
  $startTime = [DateTime]::Now
  $endTime = $startTime.AddSeconds($Seconds)

  # countdown timer and progress bar
  Write-Host "Countdown Timer Started:"
  for($i = 0; $i -lt $Seconds; $i++) {
    $remainingTime = $endTime - [DateTime]::Now
    $secondsLeft = [int]$remainingTime.TotalSeconds
    $progress = [math]::Round(($i + 1) / $Seconds * 100)
    Write-Progress -Activity "Counting Down" -Status "$secondsLeft seconds left" -PercentComplete $progress
    Start-Sleep -Seconds 1
  }

  Write-Host "`nTime's up!"

  # loop alarm sound
  try {
    [System.Media.SoundPlayer]$player = New-Object System.Media.SoundPlayer
    $player.SoundLocation = $AlarmSound
    Write-Host "Playing alarm. Press Ctrl+C to stop."

    while ($true) {
      $player.PlaySync()
    }
  } catch {
    Write-Error "Failed to play the alarm sound: $_"
  }
}
