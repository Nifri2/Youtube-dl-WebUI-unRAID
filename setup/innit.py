from os import getenv

max_dls = getenv("MAX_DL", "5")




php_conf = f"""
<?php

//Default password is "root" with md5 hash
//No "/" at the end of outputFolder or logfolder

return array(
	"bin" => "/usr/local/bin/yt-dlp",
	"security" => true,
	"password" => "63a9f0ea7bb98050796b649e85481845",
	"outputFolder" => "downloads",
	"extracter" => "ffmpeg",
	"log" => true,
	"outfilename" => "%(title)s-%(id)s.%(ext)s",
	"logFolder" => "logs",
	"max_dl" => {max_dls},
	"session_lifetime" => 86400);

?>
"""

with open('/www/youtube-dl/config/config.php') as config:
    config.write(php_conf)