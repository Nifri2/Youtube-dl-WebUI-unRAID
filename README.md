# Youtube-dl WebUI

Fork of [timendum/Youtube-dl-WebUI](https://github.com/timendum/Youtube-dl-WebUI) containerized, in order to deploy it as unRAID app.
Please checkout said repository for more information about the project.

Prebuilt Images at [DockerHub](https://hub.docker.com/r/nifri/youtube-dl-webui-unraid)


## Building

To build the container yourself run:
```sh
docker build -t youtube-dl-webui . 
```
To run the container:
```sh
docker run -p 8080:80 \ 
    -e SECURITY=true         # true = enable password, false = disable password
    -e MAX_DL=16 \           # maximum concurrent downloads allowed
    -e PASSWORD=mypassword \ # Password for the WebUI
    -v /path/to/video/folder:/www/youtube-dl/downloads \ # replace /path/to/video/folder with your preferred downlaod folder
    youtube-dl-webui
```
