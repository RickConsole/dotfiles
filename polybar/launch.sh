#!/bin/bash

# Terminate any running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
#polybar mybar &

for m in $(polybar --list-monitors | cut -d":" -f 1); do
	MONITOR=$m polybar --reload mybar &
done
