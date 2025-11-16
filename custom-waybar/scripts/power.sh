#!/bin/bash

option=$(echo -e "Shutdown\nRestart\nLogout\nSleep" | rofi -dmenu -i -p "Power")

case $option in
  Shutdown)
    systemctl poweroff
    ;;
  Restart)
    systemctl reboot
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
  Sleep)
    systemctl suspend
    ;;
esac
