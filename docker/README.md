# Dockerize Youtube-dl-WebUI

Build your own image :

`docker build -t yourname/ytdlwui .`

Run it :

`docker run -d -p 8080:80 -v /path/to/video/folder:/www/youtube-dl/downloads yourname/ytdlwui `
