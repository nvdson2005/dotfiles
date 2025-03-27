#!/bin/bash

# Get the current playing song
current_song=$(playerctl metadata --format "{{ artist }} - {{ title }}")

# Check if there is a song playing
if [ "$current_song" = "" ]; then
  echo "No song is currently playing."
else
  echo "Currently playing: $current_song"
fi
