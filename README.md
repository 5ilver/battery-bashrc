battery-bashrc
==============

.bashrc for colored battery status. Looks like: [99%+][billy@tux:~/Music]$ 

Out of the box this script will be configured for whatever laptop I happen to be working on. 

Install

cp ~/.bashrc ~/.bashrc.orig && cat battery-bashrc.sh > ~/.bashrc

Vars to set in the script:

BATTERY_DIR, Path to your battery folder with no trailing slash. Eg: BATTERY_DIR="/sys/class/power_supply/BAT0". You can probably find the path with find /sys/class | egrep -i "bat0$"

BATTERY_CHARGE. Probably either charge_now or energy_now

BATTERY_FULL. Probably either charge_full or energy_full


