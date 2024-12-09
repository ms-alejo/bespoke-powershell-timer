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

Countdown-Timer -Seconds <duration-in-seconds> -AlarmSound "<path-to-alarm-sound.wav>"
```

### 3. Stop the Script
- **Stop the Timer**: Press `ctrl+c` during the countdown.
- **Stop the Alarm**: Press `ctrl+c` when sound is playing, will stop once the alarm file end length is reached.

## Future Enhancements
- Pomodoro Style Timer

Hope this helps you in some way!
