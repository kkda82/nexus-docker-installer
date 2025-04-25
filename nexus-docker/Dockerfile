FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://ftp.daum.net/ubuntu/|g' /etc/apt/sources.list \
    && sed -i 's|http://security.ubuntu.com/ubuntu|http://ftp.daum.net/ubuntu|g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    curl git sudo build-essential pkg-config libssl-dev tzdata cmake protobuf-compiler gcc \
    && ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && . "$HOME/.cargo/env" \
    && rustup target add riscv32i-unknown-none-elf

ENV PATH="/root/.cargo/bin:$PATH"

CMD ["/bin/bash"]
