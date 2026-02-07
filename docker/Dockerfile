FROM        --platform=$TARGETOS/$TARGETARCH debian:trixie-slim

LABEL       author="lightyisreal" \
            maintainer="45460688+lightyisreal@users.noreply.github.com" \
            org.opencontainers.image.source="https://github.com/lightyisreal/dragonfly-pterodactyl" \
            org.opencontainers.image.licenses="MIT"

ENV         DEBIAN_FRONTEND=noninteractive

RUN         useradd -m -d /home/container -s /bin/bash container \
            && ln -s /home/container /nonexistent

ENV         USER=container \
            HOME=/home/container

RUN         apt update \
            && apt upgrade -y \
            && apt install -y --no-install-recommends \
                gcc g++ gdb \
                libc6 libstdc++6 libgcc-s1 libatomic1 \
                git wget curl tar zip unzip xz-utils \
                binutils cabextract \
                iproute2 net-tools procps \
                netcat-openbsd telnet \
                libsdl2-2.0-0 \
                libfontconfig1 \
                libicu-dev icu-devtools \
                libunwind8 \
                libssl-dev \
                sqlite3 libsqlite3-dev \
                locales tzdata ca-certificates \
                ffmpeg gnupg2 \
                software-properties-common \
                liblua5.3-0 \
                libz-dev libevent-dev \
                rapidjson-dev \
                libprotobuf-dev \
                libfluidsynth2 \
                tini \
            && rm -rf /var/lib/apt/lists/*

ARG         TARGETARCH

RUN         wget -q https://go.dev/dl/go1.25.7.linux-${TARGETARCH}.tar.gz \
            && rm -rf /usr/local/go \
            && tar -C /usr/local -xzf go1.25.7.linux-${TARGETARCH}.tar.gz \
            && rm -f go1.25.7.linux-${TARGETARCH}.tar.gz \
            && echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

RUN         update-locale LANG=en_US.UTF-8 \
            && dpkg-reconfigure --frontend noninteractive locales

WORKDIR     /home/container

STOPSIGNAL  SIGINT

COPY        --chown=container:container entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh

ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
