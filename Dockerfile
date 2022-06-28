FROM debian


RUN apt-get update && apt-get install -y software-properties-common

RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
    git python python3 python3-pip apache2 php curl ca-certificates


RUN rm -rf /var/lib/apt/lists/*

#Install youtube-dl
# RUN curl https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && chmod a+x /usr/local/bin/youtube-dl
RUN pip3 install youtube-dl
RUN pip3 install yt-dlp


WORKDIR /
RUN mkdir /www

WORKDIR /www
RUN git clone https://github.com/Nifri2/Youtube-dl-WebUI-unRAID youtube-dl

WORKDIR /www/youtube-dl
RUN rm -rf .git README.md img .gitignore docker

WORKDIR /
RUN chmod -R 744 /www && chown -R www-data:www-data /www

copy ./docker/apache2.conf /etc/apache2/apache2.conf
COPY ./docker/vhost.conf /etc/apache2/sites-enabled/000-default.conf

RUN ln -sf /dev/stdout /var/log/apache2/youtube-dl_access.log
RUN ln -sf /dev/stderr /var/log/apache2/youtube-dl_error.log



EXPOSE 80

VOLUME /www/youtube-dl/downloads

CMD python3 /www/youtube-dl/setup/innit.py  youtube-dl -U && /usr/sbin/apache2ctl -D FOREGROUND
