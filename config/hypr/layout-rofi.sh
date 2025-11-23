#!/bin/bash

layouts=("US" "Spanish")
codes=("us" "es")
current=$(setxkbmap -query | grep layout | awk '{print $2}')

# get current index
for i in "${!codes[@]}"; do
  if [ "${codes[$i]}" = "$current" ]; then
    index=$i
    break
  fi
done

# show rofi menu (select next layout)
choice=$(printf "%s\n" "${layouts[@]}" | rofi -dmenu -p "Layout:" -lines 2 -selected-row "$index")

# if something selected, set it
for i in "${!layouts[@]}"; do
  if [ "${layouts[$i]}" = "$choice" ]; then
    setxkbmap "${codes[$i]}"
    break
  fi
done
