#!/usr/bin/env bash
if [[ "$EUID" = 0 ]]; then
	echo "running already as root"
else
	sudo -k # asks for sudo within script
	if sudo true; then
		echo "installing..."
	else
		echo "please enter the correct password to run"
		exit 1 #exit bc of bad passwd
	fi
fi
wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic.sh # gets the noetic install script
chmod 755 ./install_ros_noetic.sh # set the script to be runnable
bash ./install_ros_noetic.sh # run the script
sudo apt-get -y install ros-noetic-joy ros-noetic-teleop-twist-joy ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc ros-noetic-rgbd-launch ros-noetic-rosserial-arduino ros-noetic-rosserial-python ros-noetic-rosserial-client ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers ros-noetic-dynamixel-sdk python3-roslaunch ros-noetic-turtlebot3-gazebo ros-noetic-turtlebot3 rospack-tools # installing all the crap
source /opt/ros/noetic/setup.bash # sourcing from the new noetic installation to enable catkin
if grep -Fxq "source /opt/ros/noetic/setup.bash" ~/.bashrc; then # add the source to .bashrc if not done already by the install script
	echo "noetic dir already sourced"
else
	echo "# source from noetic dir if not exist" >> ~/.bashrc
	echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
fi

# the following is from the lab sheet
mkdir ~/catkin_ws_rss
mkdir ~/catkin_ws_rss/src
cd ~/catkin_ws_rss/src
catkin_init_workspace
catkin_create_pkg rss_linux_pkg rospy std_msgs
git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd rss_linux_pkg
mkdir scripts
cd ../..
catkin_make

# set the turtlebot3 model to simulate in the world
export TURTLEBOT3_MODEL=burger
if grep -Fxq "export TURTLEBOT3_MODEL=" ~/.bashrc; then # set a default model to run if not set already
# you can edit this yourself by running "nano ~/.bashrc"
	echo "turtlebot model already set"
else
	echo "# turtlebot3 model set on boot" >> ~/.bashrc
	echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
fi
source ~/catkin_ws_rss/devel/setup.bash # source from the newly installed turtlebot3 workspace
if grep -Fxq "source ~/catkin_ws_rss/devel/setup.bash" ~/.bashrc; then # set the sourcing behaviour to run by default on shell start
	echo "setup.bash already sourced"
else
	echo "source ~/catkin_ws_rss/devel/setup.bash" >> ~/.bashrc
fi

echo "Use the following command to start up an empty world simulation of the turtlebot:"
echo "roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch"
echo "NOTE: this will run properly in all new shells, if you want to run it in this current shell run the following 2 commands beforehand:"
echo "source ~/catkin_ws_rss/devel/setup.bash"
echo "export TURTLEBOT3_MODEL=burger"
