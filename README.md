# Poddie

Poddie is a self-hosted media downloader and podcast feed generator. 

Poddie uses [yt-dlp](https://github.com/yt-dlp/yt-dlp) to download the media files into a folder on the local machine (e.g. media server). It then invokes [podcats](https://github.com/jakubroztocil/podcats) to generate a podcast feed for the media files and serves it via the NGINX web server (it is based on the [LinuxServer.io NGINX Docker image](https://github.com/linuxserver/docker-nginx)). You can then subscribe to the podcast by adding the podcast feed in a podcast player of your choice.

At the heart of Poddie are:

- A bash script (`/usr/local/bin/refresh`) to check for new media, download them, generate a feed, a webpage for the show and an index page for all shows.
- A bash script (`/etc/cont-init.d/999-autorefresh`) to automatically invoke `/usr/local/bin/refresh` on system startup and periodically.
- A YAML configuration file containing details of the shows.

## Features

- Downloads media files from third-party websites.
- Supports all websites that yt-dlp supports.
- Supports multiple shows.
- Generates a separate podcast feed (XML) and webpage (HTML) for each show.
- Generates an index page (HTML) of all shows.
- Checks for new episodes automatically at a configurable time interval.
- Simple configuration using a YAML file.

## Disclaimer

I am no coder and this is a hacky solution that I put together to satisfy a personal need of mine.  I came up with this because I couldn't get [Podify](https://github.com/podify-org/podify) to work on my machine. This implementation has many limitations. However, I may not have the skills or time to resolve them. Contibutions or forks are welcome.

## Installation

Docker installation is supported. Ensure you have [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/) installed on the host machine. 

The latest Docker image for Poddie is available from [Docker Hub](https://hub.docker.com/r/austozi/poddie) but for selected hardware architectures only. If what is available is unsuitable, you may build the image yourself.

### Build the Docker image

You may skip this step if using the ready-made image from Docker Hub.

1. Download the source for the [latest release](https://github.com/austozi/poddie/releases/latest) and extract the contents.
2. On the command line, navigate to the extracted directory where Dockerfile is, and execute the following: `docker build -t austozi/poddie:latest .`

### Install the Docker container

1. Download the source for the [latest release](https://github.com/austozi/poddie/releases/latest) and extract the contents.
2. On the command line, navigate to the extracted directory where docker-compose.yml is.
3. Edit docker-compose.yml as appropriate.
4. Configure shows in ./config/poddie/config.yml (mapped to /config/poddie/config.yml in the container).
5. Execute the following: `docker-compose up -d`
