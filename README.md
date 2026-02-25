# ros-noetic-turtlebot3-install
Installation scripts for automated installations of turtlebot3 simulations on ros noetic

# Environment setup
OS: Fresh install Ubuntu 20.04 (variations of different desktops (hopefully) doesn't matter, I am running it on a Lubuntu install) on a VM or on a distrobox image if you are already on distrobox supported linux distro

run this at your own risk on actual hardware and/or other Ubuntu versions

# Installation steps (normal install)
1. open a terminal and run `git clone https://github.com/fcwe1113/ros-noetic-turtlebot3-install.git`
2. run `cd ros-noetic-turtlebot3-install`
3. run `bash ros_turtlebot3_noetic_install_1.sh`
4. wait for the system to reboot and run `bash ros_turtlebot3_noetic_install_2.sh` in the correct directory
5. profit

# Installation steps (Distrobox image)
1. make sure you have distrobox installed on your computer, if not consult the documentation page here: https://distrobox.it
2. create a container of Ubuntu 20.04, I recommend using a custom home directory. (DO NOT ALLOW SPACES IN YOUR PATH, IT WILL NOT WORK PROPERLY OTHERWISE)
3. run `git clone https://github.com/fcwe1113/ros-noetic-turtlebot3-install.git`
4. run `cd ros-noetic-turtlebot3-install`
5. run `bash ros_turtlebot3_noetic_install_2.sh`
6. profit

# Troubleshooting
## `Username is Not in the Sudoers File` error
You need to add your username into the sudoers file. Do it by first running `su` using your root password, then run `visudo`. Once you are in the sudoers file, under the line `root ALL=(ALL:ALL) ALL` add in `*your_username* ALL=(ALL:ALL) ALL`, then save and exit both the file and the root shell.

DO NOT UNDER ANY CIRCUMSTANCES EDIT THE SUDOERS FILE WITHOUT USING `visudo`, YOU HAVE BEEN WARNED
## `git` is not installed
run `sudo apt install git`
