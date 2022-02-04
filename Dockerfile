FROM balenalib/rpi-raspbian

RUN apt-get update && \
    apt-get -y install gettext curl apt-transport-https && \
    update-ca-certificates --fresh && \
    curl -sSL https://dtcooper.github.io/raspotify/key.asc | apt-key add -v - && \
    echo 'deb https://dtcooper.github.io/raspotify raspotify main' | tee /etc/apt/sources.list.d/raspotify.list && \
    apt-get update && \
    apt-get -y install raspotify && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME /var/config
RUN mkfifo /var/config/pipefifo

ENV NAME RaspotifySpeaker

RUN /usr/bin/librespot --name "$NAME" -u "$USERNAME" -p "$PASSWORD" -B pipe -d /var/config/pipefifo -AP --disable-audio-cache 
