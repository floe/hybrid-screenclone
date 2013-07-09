#!/bin/bash

# valid modes: e.g. 1600x900, 2560x1440

X=$1 ; Y=$2 ; DIR=$3
MODE=${X}x${Y}

xrandr --newmode $MODE $(echo ${X}\*${Y}\*60 | bc) $X $X $X $X $Y $Y $Y $Y
xrandr --addmode VIRTUAL $MODE
xrandr --output  VIRTUAL --mode $MODE --$DIR LVDS1
sleep 2

# put local xorg.conf.nvidia into /etc/bumblebee/
optirun sleep 1e10d &
sleep 2

screenclone -s :0 -d :8 -x 1
