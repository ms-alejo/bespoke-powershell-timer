# PowerShell Timer with Alarm

This is a bespoke powershell timer that was made for use when doing habits (studying and deep-focus activities). A simple script for a countdown timer with an alarm sound that loops until stopped.

## Features

- **Countdown Timer**: specify the duration in seconds
- **Progress Bar**: a progress bar showing the remaining time and percentage until timer runs out
- **Alarm Sound**: plays `.wav` sound file after the countdown ends, looping until manually stopped

## Prerequisites

- **PowerShell**: make sure PowerShell is installed
- **Alarm sound file**: make sure to have a compatible `.wav` sound file

## Usage

### 1. Save the Script
Save the script as `countdown.ps1`

### 2. Run the Script

```powershell
first run:

. .\countdown.ps1

then run:

option 1: Countdown-Timer -Seconds <duration-in-seconds> -AlarmSound "<path-to-alarm-sound.wav>"
option 2: Countdown-Timer -Minutes <duration-in-minutes> -Seconds <duration-in-seconds> -AlarmSound "<path-to-alarm-sound.wav>"
option 3: Countdown-Timer -Hours <duration-in-hours> -Minutes <duration-in-minutes> -Seconds <duration-in-seconds> -AlarmSound "<path-to-alarm-sound.wav"
```

#### 2.1 Modify the Script with default values

change:
```powershell
param (
    [int]$Hours = {desired-default-amount-in-hours},
    [int]$Minutes = {desired-default-amount-in-minutes},
    [int]$Seconds = {desired-default-amount-in-seconds},
    [string]$AlarmSound = "{path-to-alarm-sound.wav}"
)
```
run:
```powershell
. .\countdown.ps1

Countdown-Timer
```

### 3. Stop the Script
- **Stop the Timer**: Press `ctrl+c` during the countdown.
- **Stop the Alarm**: Press `ctrl+c` when sound is playing, will stop once the alarm file end length is reached.

## Future Enhancements
- Pomodoro Style Timer

Hope this helps you in some way!
