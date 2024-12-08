# Powershell Timer with Alarm

This is a bespoke powershell timer that was made for use when doing habits

To run locally:
1. git clone
2. cd to directory
3. modify param([string]$AlarmSound = "PATH") with relevant path
4. run

```shelll
first run:
. .\countdown.ps1

then run:

Countdown-Timer -Seconds {length in seconds} -AlarmSound "{Path to sound}"
```

Hope this helps you in some way!
