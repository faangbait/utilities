# GNOME doesn't let me pin the "reboot" command to the launcher panel, so I wrote this script.

# /usr/local/bin/reboot_desktop_icon
#!/bin/sh

current_setting=$(gsettings get org.gnome.mutter center-new-windows)
gsettings set org.gnome.mutter center-new-windows true

if zenity --question \
  --title="Reboot" \
  --text="Do you want to reboot now?" \
  --ok-label="REBOOT" --cancel-label="Cancel" \
  --default-cancel; then
    sudo reboot
else
    zenity --notification --text="Reboot cancelled."
fi

gsettings set org.gnome.mutter center-new-windows ${current_setting}

# ~/.local/share/applications/reboot_icon.desktop
[Desktop Entry]
Type=Application
Name=Reboot
Exec=/usr/local/bin/reboot_desktop_icon
Icon=/usr/share/icons/ubuntu-mono-dark/actions/24/system-restart-panel.svg
Terminal=false
Comment=Reboots the system
