#!/bin/bash

CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
AC_STAT=$(cat /sys/class/power_supply/BAT0/status | grep -c Charging)

adb shell dumpsys battery set level $CHARGE
adb shell dumpsys battery set ac $AC_STAT