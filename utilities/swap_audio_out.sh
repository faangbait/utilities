#!/bin/bash

CARD="pci-0000_01_00.1"
PROFILE_VIVE="hdmi-stereo-extra2"
PROFILE_SPEAKERS="hdmi-stereo"

CURRENT=$(pactl get-default-sink)

if [ "${CURRENT}" == "alsa_output.${CARD}.${PROFILE_VIVE}" ]; then
    pactl set-card-profile "alsa_card.${CARD}" "output:${PROFILE_SPEAKERS}"
    notify-send "Audio Switched" "Output: Speakers"
else
    pactl set-card-profile "alsa_card.${CARD}" "output:${PROFILE_VIVE}"
    notify-send "Audio Switched" "Output: Vive"
fi
