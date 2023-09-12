#!/bin/bash

# Info message with your name
echo "Script by Damith Anhettigama"

# Update package list
echo "Updating package list..."
sudo apt update

# Install required packages
echo "Installing required packages..."
sudo apt-get install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison libncurses5-dev libncursesw5-dev
sudo apt install -y linux-headers-$(uname -r) git

# Build the modules
echo "Building modules..."
make

# Load kernel modules
echo "Loading kernel modules..."
sudo insmod usbserial.ko
sudo insmod cp210x.ko

# Check and print status
if [ $? -eq 0 ]; then
    echo "All operations completed successfully."
else
    echo "An error occurred during the operations."
fi
