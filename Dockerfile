FROM debian:stable-slim

LABEL maintainer="rayan.game.9236@gmail.com"

WORKDIR /project

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -y apt-utils \
  && apt-get dist-upgrade -y \
  && echo "deb http://ftp.us.debian.org/debian jessie main contrib non-free" >> /etc/apt/sources.list.d/jessie.list \
  && echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list.d/unstable.list \
  && apt-get update \
  && apt-get install -y cmake \
  && apt-get install -y g++-6 \
  && apt-get install -y clang++-6.0 \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 1 \
  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 1 \
  && apt-get install -y build-essential checkinstall python-dev python-setuptools python-pip python-smbus \
  && apt-get install -y libreadline-gplv2-dev libncursesw5-dev libgdbm-dev libc6-dev libbz2-dev \
  && apt-get install -y zlib1g-dev libsqlite3-dev \
  && apt-get install -y libssl-dev openssl \
  && apt-get install -y libffi-dev \
  && apt-get install -y gdb \
  && apt-get autoremove --purge -y \
  && apt-get autoclean -y \
  && rm -rf /var/cache/apt/* /tmp/*

CMD ["bash"]