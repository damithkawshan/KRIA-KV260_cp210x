obj-m += usbserial.o
usbserial-y := usb-serial.o generic.o bus.o

obj-m +=cp210x.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build

all:
	make -C $(KERNELDIR) M=$(PWD) modules

clean:
	make -C $(KERNELDIR) M=$(PWD) clean

