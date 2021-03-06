#!/bin/bash

# Opens a menu with a list of unicode emojis, the selection will be copied to clipboard or typed directly
# Taken from here: https://github.com/LukeSmithxyz/voidrice

# Get user selection via rofi -dmenu from emoji file.
# chosen=$(cut -d ';' -f1 ./assets/emoji.txt | rofi -dmenu -i -l 10 -fn "UbuntuMono Nerd Font Mono" -nf "#ff0066" | sed "s/ .*//")
chosen=$(cut -d ';' -f1 /bin/scripts/assets/emoji.txt | rofi -dmenu -p "> " -fn "Twemoji" | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

echo "$chosen" | tr -d '\n' | xclip -selection clipboard
notify-send  "emoji picker" "'$chosen' copied to clipboard." &
