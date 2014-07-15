# Original battery prompt idea from:
# http://basicallytech.com/blog/index.php?/archives/110-Colour-coded-battery-charge-level-and-status-in-your-bash-prompt.html
# modded, a lot
 
#Define some colors...
NON='\e[0m'     #normal
BLD='\e[01m'    #bold
ITL='\e[03m'    #italics
ULN='\e[04m'    #underline
INV='\e[07m'    #inverted
RED='\e[31m'    #red
GRN='\e[32m'    #green
YEL='\e[33m'    #yellow
BLU='\e[34m'    #blue
PRP='\e[35m'    #purple
TEL='\e[36m'    #teal
 
#Define data sources
BATTERY_DIR="/sys/class/power_supply/BAT0"
BATTERY_CHARGE="energy_now"
BATTERY_FULL="energy_full"
BATTERY_STATUS="status"
 
battery_percent()
{
REM_CAP=$(cat $BATTERY_DIR/$BATTERY_CHARGE)
FULL_CAP=$(cat $BATTERY_DIR/$BATTERY_FULL)
CHARGE=$(echo $(( $REM_CAP * 100 / $FULL_CAP )))
if [ "$CHARGE" -gt "99" ]
then
   CHARGE=100
fi
echo -e $CHARGE
}
 
battery_status()
{
BATT_STATUS=$(cat $BATTERY_DIR/$BATTERY_STATUS)
case $BATT_STATUS in
"Charging")
   BATT_STATUS="+"
   ;;
"Discharging")
   BATT_STATUS="-"
   ;;
"Full")
   BATT_STATUS="="
   ;;
*)
   BATT_STATUS="?"
   ;;
esac
echo -e $BATT_STATUS
}
 
battery_color()
{
CHARGE="$(battery_percent)"
COLOR="$RED"
if [ "$CHARGE" -gt "15" ]
then
   COLOR="$YEL"
fi
if [ "$CHARGE" -gt "30" ]
then
   COLOR="$GRN"
fi
echo -e $COLOR
}
 
PS1="\[$BLD\$(battery_color)\][\$(battery_percent)%$(battery_status)]\[$NON\][\u@\h:\[$TEL\]\w\[$NON\]]\$ "
