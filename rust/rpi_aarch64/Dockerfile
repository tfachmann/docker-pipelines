#  docker build -t <container id> .	

FROM rust:1.51

RUN dpkg --add-architecture arm64 && \
    apt-get update && apt-get upgrade -y

# get aarch64 utils
RUN apt install gcc make gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu -y

# Get OpenSSL version
WORKDIR /home/rust
ENV INSTALL_DIR /home/rust/openssl
# check `openssl version` at your target to compile the correct version
ENV OPEN_SSL_VERSION openssl-1.1.1d
RUN wget "https://www.openssl.org/source/$OPEN_SSL_VERSION.tar.gz"
RUN tar -xzvf "$OPEN_SSL_VERSION.tar.gz"
WORKDIR "$OPEN_SSL_VERSION"
RUN ./Configure linux-aarch64 shared --prefix=$INSTALL_DIR --openssldir=$INSTALL_DIR/openssl --cross-compile-prefix=aarch64-linux-gnu-

RUN make depend
RUN make
ENV OPENSSL_LIB_DIR /home/rust/$OPEN_SSL_VERSION
ENV OPENSSL_INCLUDE_DIR /home/rust/$OPEN_SSL_VERSION/include

RUN rustup target add aarch64-unknown-linux-gnu
RUN rustup install nightly

ENV CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER aarch64-linux-gnu-gcc
ENV CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_AR aarch64-linux-gnu-ar

RUN useradd rust --user-group --create-home --shell /bin/bash --groups sudo
WORKDIR /home/rust/src
