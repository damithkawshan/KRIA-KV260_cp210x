## Install Required Packages
Make sure you have the necessary packages installed for building kernel modules. Open a terminal and run the following commands:

```bash
sudo apt update
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison libncurses5-dev libncursesw5-dev
sudo apt install linux-headers-$(uname -r) git
```

## Edit the Sources List
Open the ```/etc/apt/sources.list``` file in a text editor with administrative privileges. In the ```sources.list``` file, look for lines that start with `deb-src`. They might be commented out with a `#` at the beginning of the line. Remove the `#` character at the beginning of the lines to uncomment them.

```bash
# deb-src http://archive.ubuntu.com/ubuntu focal main restricted
# deb-src http://archive.ubuntu.com/ubuntu focal-updates main restricted
```
## Download Kernel Sources
Once you've successfully updated the package information, try downloading the kernel sources.

```bash
sudo apt update
sudo apt-get source linux-image-$(uname -r)
```

## Build Required Driver from Sources
Copy the following files to another directory (Maybe you need to compile the whole kernel first).
```
<linux-kernel-src-dir>/drivers/usb/serial/ [cp210x.c usb-serial.c bus.c generic.c]
```
## Create Makefile
Copy the following content to the Makefile and build it.

```make
obj-m += usbserial.o
usbserial-y := usb-serial.o generic.o bus.o
obj-m += cp210x.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build

all:
    make -C $(KERNELDIR) M=$(PWD) modules

clean:
    make -C $(KERNELDIR) M=$(PWD) clean
```
## Build and Install the Kernel Module
Run the following commands to build and install the kernel module:

```bash
make
sudo insmod usbserial.ko
sudo insmod cp210x.ko
```
