# RPI armv6

Pipeline for ARMv6 (Raspbberrypi Zero + 1).
You might have to change the OpenSSL version in advance, see the [Dockerfile](./Dockerfile) for more details.

Build it as

```
docker build -t rpi-compile-armv6 .
```

and move the [cross-build.sh](./cross-build.sh) file to the root of the Cargo project you want to build.

! The permissions might be of `root:root` and I have not found a good workaround yet, so you have to `sudo chmod` afterwards.
