#!/bin/bash

if [ ! -f "./gatekeeper.py" ] && [ ! -f "./gatekeeper.desktop" ];
then
    echo "please run this file from the base directory"
    exit 1
fi

if [ "$(id -u)" -eq 0 ];
then
    echo "please execute do not run as root"
    exit 1
fi

sudo cp ./gatekeeper.py /usr/local/bin/gatekeeper

if [ -d ~/.config/autostart ];
then
    cp ./gatekeeper.desktop ~/.config/autostart
else
    echo "skipping startup unable to locate ~/.config/autostart"
fi