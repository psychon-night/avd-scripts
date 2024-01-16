Scripts that I use for android virtual devices

#### sync_battery
- Grabs battery information (percentage and charging status) from the host and pushes it to the running AVD
- Side effect: any real device connected via ADB will show the host's battery charge
- Intended usage: `watch -n 1 sync_battery.sh`
