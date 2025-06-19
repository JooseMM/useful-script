#!/bin/sh

# Start DWM and everything else needed
nitrogen --restore
/mnt/code/source/dwm/scripts/dwm-bar.sh &
picom &
exec dwm
