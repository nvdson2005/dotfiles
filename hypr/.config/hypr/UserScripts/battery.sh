#!/bin/bash

# Get battery status
#battery_status=$(cat /sys/class/power_supply/BAT1/status)

# Get battery capacity
battery_capacity=$(cat /sys/class/power_supply/BAT1/capacity)

#echo "Battery Status: $battery_status"
echo "󰁹 $battery_capacity%"
