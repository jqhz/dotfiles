#!/usr/bin/env bash

# ―――――――――――――――――――――――――――――――
# Polybar launch script for i3
# ―――――――――――――――――――――――――――――――

# 1) Kill any already running Polybar instances
killall -q polybar

# 2) Wait until they’re really gone
while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 0.1
done

# 3) Launch bar(s)
#    If you have multiple monitors, this will fire one 'top' bar per connected output.
if command -v xrandr >/dev/null; then
  for MONITOR in $(xrandr --query | grep " connected" | cut -d' ' -f1); do
    MONITOR="$MONITOR" polybar top -c ~/.config/polybar/config.ini &
  done
else
  # fallback: single bar
  polybar top -c ~/.config/polybar/config.ini &
fi

# 4) (optional) If you have a bottom bar, duplicate the block above:
#    for MONITOR in …; do
#      MONITOR="$MONITOR" polybar bottom -c ~/.config/polybar/config.ini &
#    done

