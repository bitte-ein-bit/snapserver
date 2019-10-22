FROM ubuntu:latest

RUN apt-get update && apt-get install wget -y

ARG SNAPCASTVERSION=0.16.0

RUN wget 'https://github.com/badaix/snapcast/releases/download/v'$SNAPCASTVERSION'/snapserver_'$SNAPCASTVERSION'_amd64.deb'

RUN dpkg -i --force-all 'snapserver_'$SNAPCASTVERSION'_amd64.deb'
RUN apt-get -f install -y

RUN mkdir -p /root/.config/snapcast/

EXPOSE 1704
EXPOSE 1780

ENTRYPOINT ["snapserver"]