# Poddie

Poddie is a self-hosted media downloader and podcast feed generator. It downloads media files from third-party websites and generates a podcast feed for them. It will check for new epidoes at a configurable time interval. It supports multiple feeds for different shows.

Poddie uses [yt-dlp](https://github.com/yt-dlp/yt-dlp) to download the media files into a folder on the local machine (e.g. media server), and so supports any sources that yt-dlp supports. It then invokes [podcats](https://github.com/jakubroztocil/podcats) to generate a podcast feed for the media files. You can then subscribe to the podcast by adding the podcast feed in a podcast player of your choice.

## Installation

Docker installation is supported. Ensure you have `docker-ce` and `docker-compose` installed on the host machine. The latest image is available from [Docker Hub](https://hub.docker.com/r/austozi/poddie) but for selected hardware architectures only. If a suitable image is not available to you, you may build the image yourself.

### Build the Docker image

1. Download the source for the [latest release](https://github.com/austozi/poddie/releases/latest) and extract the contents.
2. On the command line, navigate to the extracted directory where Dockerfile is, and execute the following: 

```
docker build -t austozi/poddie:latest .
```

### Install the Docker container

1. Download the source for the [latest release](https://github.com/austozi/poddie/releases/latest) and extract the contents.
2. On the command line, navigate to the extracted directory where docker-compose.yml is.
3. Edit docker-compose.yml as appropriate.
4. Configure shows in ./config/poddie/config.yml (mapped to /config/poddie/config.yml in the container).
5. Execute the following: 
 
```
docker-compose up -d
```
