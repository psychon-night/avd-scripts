#!/bin/bash                                
DEVICE_NAME="emulator-5554" # Enter your ADB device's name here. You can get it with "adb devices"

# Do not modify beyond this point
CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
AC_STAT=$(cat /sys/class/power_supply/BAT0/status | grep -c Charging)

adb -s $DEVICE_NAME shell dumpsys battery set level $CHARGE

if [ "$AC_STAT" -eq "1" ]; then
        adb -s $DEVICE_NAME shell dumpsys battery set status 2
else
        adb -s $DEVICE_NAME shell dumpsys battery set status 3
fi

adb -s $DEVICE_NAME shell dumpsys battery set ac $AC_STAT
