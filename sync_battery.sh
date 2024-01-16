#!/bin/bash                                
CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
AC_STAT=$(cat /sys/class/power_supply/BAT0/status | grep -c Charging)

adb shell dumpsys battery set level $CHARGE

if [ "$AC_STAT" -eq "1" ]; then
        adb shell dumpsys battery set status 2
else
        adb shell dumpsys battery set status 3
fi

adb shell dumpsys battery set ac $AC_STAT
