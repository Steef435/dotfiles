#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#Default keyboard layout(For example, in altgr-intl, use [altgr+shift+"] instead of [shift+"] to generate chars like ë)
#Change this setting for the current session by executing setxkbmap [layout]. Standard us is 'us', standard international is 'us intl'
setxkbmap us altgr-intl &

#For some fonts(like Terminus):
xset +fp /usr/share/fonts/local
xset fp rehash

#Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Resolution
source ~/.xinit/resolution

xsetroot -cursor_name left_ptr &

# Wallpaper
source ~/.xinit/wallpaper

# dircolors theme
eval `dircolors /usr/share/dircolors/dircolors.ansi-dark`

# Terminal emulator
urxvtd &

# dwm status
~/scripts/status/status.sh &

# Start dwm in a loop
while true; do
	# Log stderror to a file
	dwm 2> ~/.dwm.log
done
