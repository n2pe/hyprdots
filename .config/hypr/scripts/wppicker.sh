#!/bin/bash

# === CONFIG ===
WALLPAPER_DIR="$HOME/Pictures/wallpapers" 
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

# === handle spaces name
IFS=$'\n'

# === ICON-PREVIEW SELECTION WITH ROFI, SORTED BY NEWEST ===
SELECTED_WALL=$(for a in $(ls -t *.jpg *.png *.gif *.jpeg 2>/dev/null); do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -p "")
[ -z "$SELECTED_WALL" ] && exit 1
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

# === SET WALLPAPER ===
# this is supposed to be with matugen but its currently broken
# this also means system colours are somehwat broken
matugen image "$SELECTED_PATH"
swww img "$SELECTED_PATH" --transition-step 90 --transition-type any --transition-fps 144 

# === CREATE SYMLINK ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

