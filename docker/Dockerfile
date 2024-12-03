FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="lightyisreal" maintainer="45460688+lightyisreal@users.noreply.github.com"

LABEL       org.opencontainers.image.source="https://github.com/lightyisreal/dragonfly-pterodactyl"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND noninteractive

RUN         useradd -m -d /home/container -s /bin/bash container

RUN         ln -s /home/container/ /nonexistent

ENV         USER=container HOME=/home/container

RUN         apt update \
            && apt upgrade -y

RUN         apt install -y gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
            libfontconfig libicu67 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev-compat libduktape205 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates \
            liblua5.3-0 libz-dev rapidjson-dev tzdata libevent-dev libzip4 libprotobuf23 libfluidsynth2 procps libstdc++6 tini
# f
RUN         wget -q https://go.dev/dl/go1.23.3.linux-amd64.tar.gz \
            && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz \
            && rm -rf go1.23.3.linux-amd64.tar.gz \
            && echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

RUN         update-locale lang=en_US.UTF-8 \
            && dpkg-reconfigure --frontend noninteractive locales


WORKDIR    /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
