#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

xrandr --newmode "720x720"   41.50  720 752 824 928  720 723 733 748 -hsync +vsync
xrandr --addmode DSI-1 720x720
xrandr --output DSI-1 --mode 720x720
unclutter -idle 0.2 &

mkdir $dir/logs 2>/dev/null
rm $dir/logs/*.log 2>/dev/null

sleep 15
$dir/pull.sh
$dir/simvim.sh |& tee -a $dir/logs/simvim_`date +%F`.log &
