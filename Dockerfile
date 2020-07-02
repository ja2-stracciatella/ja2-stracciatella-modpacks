FROM debian:buster-slim

RUN apt-get -yq update \
    && apt-get -yq install bash curl dpkg git make zip

WORKDIR /workdir

ADD . /workdir

CMD make all