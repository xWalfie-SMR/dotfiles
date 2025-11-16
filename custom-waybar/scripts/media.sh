#!/bin/bash

status=$(playerctl status 2>/dev/null)
if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
  artist=$(playerctl metadata artist 2>/dev/null)
  title=$(playerctl metadata title 2>/dev/null)
  
  if [ -n "$artist" ] && [ -n "$title" ]; then
    text="$artist - $title"
  elif [ -n "$title" ]; then
    text="$title"
  else
    text="No media"
  fi
  
  echo "{\"text\":\"$text\", \"class\":\"$status\"}"
else
  echo "{\"text\":\"\", \"class\":\"stopped\"}"
fi
