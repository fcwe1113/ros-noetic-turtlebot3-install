# ros-noetic-turtlebot3-install
Installation scripts for automated installations of turtlebot3 simulations on ros noetic

# Environment setup
OS: Ubuntu 20.04 (variations of different desktops (hopefully) doesn't matter, I am running it on a Lubuntu install)

This script is intended for a clean install as a VM guest OS, run this at your own risk on actual hardware

# Installation steps
1. open a terminal and run `git clone https://github.com/fcwe1113/ros-noetic-turtlebot3-install.git`
2. run `cd ros-noetic-turtlebot3-install`
3. run `bash ros_turtlebot3_noetic_install_1.sh`
4. wait for the system to reboot and run `bash ros_turtlebot3_noetic_install_2.sh` in the correct directory
5. profit

# Troubleshooting
## `Username is Not in the Sudoers File` error
You need to add your username into the sudoers file. Do it by first running `su` using your root password, then run `visudo`. Once you are in the sudoers file, under the line `root ALL=(ALL:ALL) ALL` add in `*your_username* ALL=(ALL:ALL) ALL`, then save and exit both the file and the root shell.

DO NOT UNDER ANY CIRCUMSTANCES EDIT THE SUDOERS FILE WITHOUT USING `visudo`, YOU HAVE BEEN WARNED
## `git` is not installed
run `sudo apt install git`
