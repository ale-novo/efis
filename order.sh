#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

simvim_title='SimVimPanel'
simvim_bin='SimVimPanel_RPi'
splash_title='pqiv'
splash_bin='pqiv'

while true; do
  if pgrep "$simvim_bin" >/dev/null; then
    wmctrl -a "$simvim_title"
  fi

  if pgrep "$splash_bin" >/dev/null; then
    wmctrl -a "$splash_title"
  fi
done
