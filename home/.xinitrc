#!/bin/zsh
syndaemon -t -k -i 2 -d &
xrdb -merge ~/.Xresources
setxkbmap ro
exec ck-launch-session dbus-launch awesome
