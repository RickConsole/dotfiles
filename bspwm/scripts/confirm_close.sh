#!/bin/bash

# Set the list of applications for which to show a confirmation dialog
apps=("firefox" "obs")

# Get the focused window's class name
focused_class=$(xprop -id "$(xdotool getwindowfocus)" | awk '/WM_CLASS/{print $4}' | tr -d \")

# Check if the focused window's class name is in the list of apps
for app in "${apps[@]}"; do
  if [[ "$focused_class" == *"${app}"* ]]; then
    # Show a confirmation dialog
    if zenity --question --title="Confirm Close" --text="Are you sure you want to close $focused_class?"; then
      # Close the window if the user confirms
      bspc node -c
    fi
    exit 0
  fi
done

# Close the window if it's not in the list of apps
bspc node -c
