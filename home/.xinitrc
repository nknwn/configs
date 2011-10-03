#!/bin/bash
syndaemon -t -k -i 2 -d &
exec ck-launch-session dbus-launch openbox-session
xrdb -merge ~/.Xresources
