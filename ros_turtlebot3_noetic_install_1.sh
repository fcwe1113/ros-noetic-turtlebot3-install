#!/usr/bin/env bash
echo "note this script would update the system and then reboot, please run the next install script to continue installation"
if [[ "$EUID" = 0 ]]; then
	echo "running already as root"
else
	sudo -k # asks for sudo within script
	if sudo true; then
		echo "updating system..."
	else
		echo "please enter the correct password to run"
		exit 1 #exit bc of bad passwd
	fi
fi
sudo apt-get -y update
sudo apt-get -y upgrade
sudo reboot
