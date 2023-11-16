FROM        --platform=$TARGETOS/$TARGETARCH golang:1.21-alpine

LABEL       author="ImLighty" maintainer="imlighty@apexie.dev"

LABEL       org.opencontainers.image.source="https://github.com/imlighty/dragonfly-pterodactyl"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apk add --update --no-cache ca-certificates tzdata bash \
				&& adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]