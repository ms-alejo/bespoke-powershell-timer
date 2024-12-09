function Countdown-Timer {
param(
    [int]$Hours = 0,
    [int]$Minutes = 0,
    [int]$Seconds = 60,
    [string]$AlarmSound = "./alarm-sounds/lamp_3.wav"
  )

  # calculate time in seconds
  $totalSeconds = ($Hours * 3600) + ($Minutes * 60) + $Seconds;
  if ($totalSeconds -le 0) {
    Write-Error = "Please enter duration greater than zero."
    return
  }

  # check if the alarm sound file exists
  if (!(Test-Path -Path $AlarmSound)) {
    Write-Error "The specified alarm sound file '$AlarmSound' does not exist."
    return
  }

  # check for correct file type
  $supportedExtensions = @(".wav")
  $fileExtension = [System.IO.Path]::GetExtension($AlarmSound).ToLower()
  if ($fileExtension -notin $supportedExtensions) {
    Write-Error "Unsupported file format. Please provide a file with the following extension: $($supportedExtensions)"
    return
  }

  # calculate time
  $startTime = [DateTime]::Now
  $endTime = $startTime.AddSeconds($totalSeconds)

  # countdown timer and progress bar
  Write-Host "Countdown Timer Started:"

  try {
    for ($elapsed = 0; $elapsed -le $totalSeconds; $elapsed++) {
      $remainingSeconds = $totalSeconds - $elapsed
      $remainingTime = [TimeSpan]::FromSeconds($remainingSeconds)
      $formattedTime = "{0:D2}:{1:D2}:{2:D2}" -f $remainingTime.Hours, $remainingTime.Minutes, $remainingTime.Seconds
      $progress = [math]::Round(($elapsed / $totalSeconds) * 100)

      if ($elapsed -eq $totalSeconds) {
        $progress = 100
      }

      Write-Progress -Activity "Counting Down:" -Status "$formattedTime remaining" -PercentComplete $progress
      Start-Sleep -Seconds 1
    }
  } catch {
    Write-Warning "Countdown stopped by user."
    return
  }

  Write-Host "`nTime's up!"

  # loop alarm sound
  try {
    [System.Media.SoundPlayer]$player = New-Object System.Media.SoundPlayer
    $player.SoundLocation = $AlarmSound
    Write-Host "Playing alarm. Press Ctrl+C to stop the alarm. `n`n*Note: the alarm will stop once the sound file has finished playing." 

    while ($true) {
      $player.PlaySync()
    }
  } catch {
    Write-Error "Failed to play the alarm sound: $_"
  }
}
