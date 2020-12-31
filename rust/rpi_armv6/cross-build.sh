#!/bin/bash

# Run this script from the directory with the Cargo project.

docker run --rm -it \
	--env CARGO_HOME="/home/rust/src/cargo_home" \
	-v "$(pwd)":/home/rust/src rpi-compile-armv6 \
	cargo build --target=arm-unknown-linux-gnueabihf --release
