![Build status](https://github.com/joonas-fi/spotifyd-docker/workflows/Build/badge.svg)
[![Download](https://img.shields.io/docker/pulls/joonas/spotifyd.svg?style=for-the-badge)](https://hub.docker.com/r/joonas/spotifyd/)

[Spotifyd](https://github.com/Spotifyd/spotifyd) Docker image with actual instructions for use with
PulseAudio on your host system.

See accompanying blog post:
[Audio in Docker containers, Linux audio subsystems, Spotifyd](https://joonas.fi/2020/12/audio-in-docker-containers-linux-audio-subsystems-spotifyd/)


How to run
----------

```console
$ docker run -d \
	--name spotify
	--user "$(id -u)"
	-v "/run/user/$UID/pulse/native:/var/run/pulseaudio.sock"
	joonas/spotifyd:LOOK_FOR_TAG_FROM_DOCKERHUB
	--device-name HTPC
	--username YOUR_USERNAME
	--password YOUR_PASSWORD
```

Notes:

- Spotify device name cannot contain spaces (and probably other special chars!)
- This image is hardcoded to look for PulseAudio socket at `/var/run/pulseaudio.sock`
- User ID needs to match the user who's running PulseAudio (`$UID` is a good assumption)


Roadmap
-------

- Use Alpine linux Docker image for more light-weight image. I tried this, but Alpine's lack of glibc
  brought problems that I could not solve even with various community-provided compat layer packages.
  Might be easier to just compile Spotifyd from scratch for Alpine's musl and while recompiling anyway,
  enable PulseAudio to rid of ALSA client proxy.
