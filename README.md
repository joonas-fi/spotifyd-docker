![Build status](https://github.com/joonas-fi/spotifyd-docker/workflows/Build/badge.svg)
[![Download](https://img.shields.io/docker/pulls/joonas/spotifyd.svg?style=for-the-badge)](https://hub.docker.com/r/joonas/spotifyd/)

Spotifyd Docker image that you can actual instructions for use with PulseAudio.


How to run
----------

```console
$ docker run -d \
	--name spotifyd
	--user "$(id -u)"
	-v "/run/user/$UID/pulse/native:/var/run/pulseaudio.sock"
	joonas/spotifyd:LOOK_FOR_TAG_FROM_DOCKERHUB
	--device-name HTPC
	--username YOUR_USERNAME
	--password YOUR_PASSWORD
```

Notes:

- This image is hardcoded to look for PulseAudio socket at `/var/run/pulseaudio.sock`
- User ID needs to match the user who's running PulseAudio (`$UID` is a good assumption)

