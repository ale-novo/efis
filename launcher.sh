#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mode=$1

xrandr --newmode "720x720"   41.50  720 752 824 928  720 723 733 748 -hsync +vsync
xrandr --addmode DSI-1 720x720
xrandr --output DSI-1 --mode 720x720
unclutter -idle 0.2 &

pqiv -i --fullscreen /home/pi/efis/splash.png &
wmctrl -r 'pqiv' -b add,above

mkdir $dir/logs 2>/dev/null
rm $dir/logs/*.log 2>/dev/null

sleep 15
$dir/pull.sh
$dir/simvim.sh "$mode" |& tee -a $dir/logs/simvim_`date +%F`.log &

sleep 15
pkill pqiv
