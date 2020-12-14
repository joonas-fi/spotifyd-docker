# Debian would install GPU drivers etc. for installing Alsa/PulseAudio.
# Alpine craps out for spotifyd due to glibc dependencies (I struggled with multiple tries)
FROM ubuntu:latest

ENV PULSE_SERVER=unix:/var/run/pulseaudio.sock

ENTRYPOINT ["/usr/bin/spotifyd", "--no-daemon"]

RUN apt update && apt install -y alsa-utils libpulse0 libasound2-plugins wget

RUN cd /tmp \
	&& wget -q https://github.com/Spotifyd/spotifyd/releases/download/v0.2.24/spotifyd-linux-slim.tar.gz \
	&& tar -xvzf spotifyd-linux-slim.tar.gz \
	&& mv spotifyd /usr/bin/spotifyd \
	&& rm spotifyd-linux-slim.tar.gz

# (somewhat) simplified config to just proxy to PulseAudio
ADD alsa.conf /usr/share/alsa/alsa.conf
