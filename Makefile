EXTRA_CFLAGS += -Wall -Wno-unused-variable

obj-m += gspca_kinect2.o
gspca_kinect2-objs += kinect2.o

obj-m += gspca_main_kinect2.o
gspca_main_kinect2-objs += gspca.o


KDIR ?= "/lib/modules/$(shell uname -r)/build"

all:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" modules

install:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" modules_install
	depmod -a

clean:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" clean