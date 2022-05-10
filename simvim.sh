#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

simvim_bin='SimVimPanel_RPi'
simvim_path="$dir/simvim/"

cd "$simvim_path"

while true; do

  if pgrep "$simvim_bin" >/dev/null; then
    sleep 1
  else
    ./$simvim_bin &
    sleep 1
  fi

done
