#!/bin/sh
# ~/.xinitrc Configuration File by Edouard Fazenda <edouard.fazenda@gmail.com>

# Activate num lock 
numlockx &

# Start xscreensaver backgrounded
xscreensaver --no-splash &

# Customization of X Server (Pointer and Bip disabled)
xset b off &
xsetroot -cursor_name left_ptr -fg white -bg black &

# Set Wallpaper background (start feh by using the calling the command feg --bg--scale /path/to/file).
sh ~/.fehbg &

# Start the urxvt 256 colors daemon in quiet/fork options
urxvt256c-mld -q -o -f

# Start a urwvt client which will be attach to the urwvt 256 colors daemon
urxvt256c-mlc &

# Exec the i3 windows manager
exec i3
