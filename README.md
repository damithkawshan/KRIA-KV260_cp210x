## Install Required Packages
Make sure you have the necessary packages installed for building kernel modules. Open a terminal and run the following commands:

```bash
sudo apt update
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison libncurses5-dev libncursesw5-dev
sudo apt install linux-headers-$(uname -r) git
```

## Build Required Driver from Sources
Download this repo to your kria kv260.

## Build and Install the Kernel Module
Run the following commands to build and install the kernel module:

```bash
make
sudo insmod usbserial.ko
sudo insmod cp210x.ko
```
