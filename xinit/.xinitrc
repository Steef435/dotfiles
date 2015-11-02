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
if [ -e ~/.xinit/resolution ]; then
	source ~/.xinit/resolution
fi

xsetroot -cursor_name left_ptr &

# Wallpaper
if [ -e ~/.xinit/wallpaper ]; then
	source ~/.xinit/wallpaper
fi

# dircolors theme
eval `dircolors /usr/share/dircolors/dircolors.ansi-dark`

# Terminal emulator
urxvtd &

# dwm status
~/scripts/status/status.sh "#22a2c9" &

# Start dwm in a loop
while true; do
	# Log stderror to a file
	dwm 2> ~/.dwm.log
done
