function Countdown-Timer {
  param(
    [int]$Seconds = 60,
    [string]$AlarmSound = "D:\code\personal\terminal-timer-script\alarm-sounds\lamp_3.wav"
  )

  if (!(Test-Path -Path $AlarmSound)) {
    Write-Error "The specified alarm sound file '$AlarmSound' does not exist."
    return
  }

  $supportedExtensions = @(".wav")
  $fileExtension = [System.IO.Path]::GetExtgension($AlarmSound).ToLower()
  if ($fileExtension -notin $supportedExtensions) {
    Write-Error "Unsupported file format. Please provide a file with the following extension: $($supportedExtensions)"
    return
  }

  $startTime = [DateTime]::Now
  $endTime = $startTime.AddSeconds($Seconds)

  while ($endTime -gt [DateTime]::Now) {
    $remainingTime = $endTime - [DateTime]::Now
    $secondsLeft = [int]$remainingTime.TotalSeconds
    Write-Host -NoNewLine "Time remaining: $secondsLeft seconds `r"
    Start-Sleep -Seconds 1
  }

  Write-Host "Time's up!"
  [System.Media.SoundPlayer]$player = New-Object System.Media.SoundPlayer
  $player.SoundLocation = $AlarmSound
  $player.PlaySync()
}
