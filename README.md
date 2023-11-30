# gspca-kinect2

Linux kernel driver for the "Kinect for Windows 2" sensor.

## Requirements ##
* Linux 3.x+

## Build & install

Build
```
$ make
```

Install 
```
$ sudo make install
$ echo -e "videodev\ngspca_main_kinect\ngspca_kinect2" | sudo tee -a /etc/modules
$ sudo reboot
```

### Raspberry Pi

All the pi models except for the 4B should be good to use the regular install instructions. The Pi 4B (non 64 bit OS)
doesn't contain the linux source code to build modules with, so you need to download it yourself. The Pi 4B uses 
a 64 bit kernel with a 32 bit userland and this makes it hard to cross-compile for the kernel though. The easiest
way to get it working is to switch to the 32 bit version kernel and then download the source.

Do this by appening this line to `/boot/config.txt`
```
arm_64bit=0
```
Then reboot
```
$ sudo reboot
```

You should now be able to follow the install instructions at https://github.com/RPi-Distro/rpi-source and download the kernel using

```
$ rpi-source
```
You should now be able to follow the Build and Install instructions above.

## Usage

This driver provides two v4l2 interfaces per a single kinect sensor; color camera is mapped to /dev/video0, and depth camera is mapped to /dev/video1. If you have two or more sensors, they shall be mappaed to /dev/videoX, where X are (2*n) for n-th color and (2*n+1) for n-th depth.

### Capture color video

```
$ ffmpeg  -framerate 30 -video_size 640x480 -i /dev/video0  test.avi  
$ mplayer test.avi  
```

### Misc

```
$ v4l-info /dev/video0  
$ v4l-info /dev/video1  
$ v4l2ucp preview  
```

# Acknowledgements

This driver is based on the following discussions and source codes;
- libfreenect2, https://github.com/OpenKinect/libfreenect2
- Analyzing Kinect 2 ISO data, https://groups.google.com/forum/#!topic/openkinect/8Aa8ab3aAs4

Special thanks to the people in the OpenKinect project!!!


Hiromasa YOSHIMOTO
