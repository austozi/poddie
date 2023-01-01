FROM ghcr.io/linuxserver/nginx:latest

LABEL maintainer=austozi

ENV PODDIE_TITLE=Podcasts
ENV PODDIE_BASE_URL=http://localhost:5000
ENV PODDIE_DESCRIPTION="Podcasts generated from downloaded media"
ENV PODDIE_ICON=http://localhost:5000/icon.png
ENV PODDIE_UPDATE_INTERVAL=12h

# Install base packages.
RUN apk add --no-cache \
	coreutils \
	ffmpeg \
	gcc \
	g++ \
	jq \
	libc-dev \
	python3-dev

# Install latest pip.
RUN python3 -m ensurepip
RUN python3 -m pip install -U \
	niet \
	pip \
	wheel \
	yt-dlp \
	podcats

COPY ./root/ /

RUN chmod +x /usr/local/bin/*
RUN chmod +x /etc/cont-init.d/*
