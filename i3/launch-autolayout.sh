#!/usr/bin/env bash

# silently kill any running instances
killall -q i3-auto-layout

# wait for them to exit
while pgrep -x i3-auto-layout >/dev/null; do sleep 0.1; done

# launch a fresh one
i3-auto-layout &

