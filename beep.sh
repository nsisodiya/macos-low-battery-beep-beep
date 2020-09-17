#!/bin/bash
while true;
do 
    echo ""
    charging_level=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
    charging_status=$(pmset -g batt | grep charging | cut -f4 -d" " | cut -f1 -d ";")
    echo "Cuttent charing level is $charging_level and Battery is $charging_status"
    if [ "$charging_status" == "discharging" ];then
        if (( charging_level < 10 )); then
            echo "Battery is LOW and Less than 10% & Discharging"
            #amixer set 'Master' 100%
            afplay /System/Library/Sounds/Blow.aiff
        fi
    fi
    sleep 5; 
done
