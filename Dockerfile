FROM python:3.12-alpine3.19

# renovate: datasource=repology depName=alpine_3_20/snapcast versioning=loose
ARG SNAPCAST_VERSION=0.28.0-r1

RUN apk add --no-cache \
    bash \
    snapcast-server=${SNAPCAST_VERSION} \
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
