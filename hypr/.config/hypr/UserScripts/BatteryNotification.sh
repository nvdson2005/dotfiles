#!/bin/bash
# Function to send notification
send_notification() {
    local level=$1
    notify-send --urgency=NORMAL "Battery Low" "Battery level is ${level}%"
}

send_urgent_notification() {
    local level=$1
    notify-send --urgency=CRITICAL "Battery Critically Low" "Battery level is ${level}%"
    hyprctl notify 0 10000 "rgb(ff1ea3)" "Your Battery Is Really Low: ${level}%"
    mpv ../UserSounds/battery-low.ogg 
}
# Infinite loop to check battery level
while true; do
    # Get the battery level
    battery_level=$(cat /sys/class/power_supply/BAT1/capacity)

    # Check battery level and send notifications
    if [ "$battery_level" -le 10 ]; then
        send_urgent_notification "$battery_level"
    elif [ "$battery_level" -le 20 ]; then
        send_urgent_notification "$battery_level"
    elif [ "$battery_level" -le 50 ]; then
        send_notification "$battery_level"
    fi
    # Sleep for 5 minutes before checking again
    sleep 300
done
