FROM python:3.12-alpine

# renovate: datasource=github-releases depName=badaix/snapcast
ARG SNAPCAST_VERSION=0.27.0-r4

RUN apk add --no-cache \
    bash \
    snapcast=${SNAPCAST_VERSION} \
    wget \
    sed \
    # Python dependencies
    python3 \
    py3-pip \
    pkgconfig \
    py3-gobject3

# Install python dependencies for control scripts
RUN python3 -m pip install \
    python-mpd2 \
    musicbrainzngs \
    websocket-client

EXPOSE 1704
EXPOSE 1780

ENTRYPOINT ["snapserver"]
