# RPI armv6

Pipeline for ARM64 / AArch64 ([Raspberrypi 2 / 3](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3) [/ 4](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4) with Arch Linux AArch64).
You might have to change the OpenSSL version in advance, see the [Dockerfile](./Dockerfile) for more details.

Build it as

```
docker build -t rpi-compile-aarch64 .
```

and move the [cross-build_aarch64.sh](./cross-build_aarch64.sh) file to the root of the Cargo project you want to build.

! The permissions might be of `root:root` and I have not found a good workaround yet, so you have to `sudo chmod` afterwards.
