#  docker build -t <container id> .	

FROM rust:1.51

RUN dpkg --add-architecture armhf && \
    apt-get update && apt-get upgrade -y

# Get raspberry pi tools (compiler)
WORKDIR /home/rust
RUN git clone https://github.com/raspberrypi/tools.git --depth=1 pitools
ENV PATH="/home/rust/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:${PATH}"

# Get OpenSSL version
ENV INSTALL_DIR /home/rust/openssl
# check `openssl version` at your target to compile the correct version
ENV OPEN_SSL_VERSION openssl-1.1.1d
RUN wget "https://www.openssl.org/source/$OPEN_SSL_VERSION.tar.gz"
RUN tar -xzvf "$OPEN_SSL_VERSION.tar.gz"
WORKDIR "$OPEN_SSL_VERSION"
RUN ./Configure linux-generic32 shared --prefix=$INSTALL_DIR --openssldir=$INSTALL_DIR/openssl --cross-compile-prefix=/home/rust/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-
RUN make depend
RUN make
ENV OPENSSL_LIB_DIR /home/rust/$OPEN_SSL_VERSION
ENV OPENSSL_INCLUDE_DIR /home/rust/$OPEN_SSL_VERSION/include

# You might want to substitute it with armv7 optimizations
RUN rustup target add arm-unknown-linux-gnueabihf
RUN rustup install nightly

ENV CARGO_TARGET_ARM_UNKNOWN_LINUX_GNUEABIHF_LINKER arm-linux-gnueabihf-gcc
ENV CARGO_TARGET_ARM_UNKNOWN_LINUX_GNUEABIHF_AR arm-linux-gnueabihf-ar


ENV ZLIB_NO_PKG_CONFIG 1

RUN useradd rust --user-group --create-home --shell /bin/bash --groups sudo
WORKDIR /home/rust/src
