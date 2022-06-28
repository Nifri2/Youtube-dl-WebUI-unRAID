<?php

//Default password is "root" with md5 hash
//No "/" at the end of outputFolder or logfolder



return array(
	"bin" => "/usr/local/bin/yt-dlp",
	"security" => true,
	"password" => md5(getenv('PASSWORD')),
	"outputFolder" => "downloads",
	"extracter" => "ffmpeg",
	"log" => true,
	"outfilename" => "%(title)s-%(id)s.%(ext)s",
	"logFolder" => "logs",
	"max_dl" => getenv('MAX_DL'),
	"session_lifetime" => 86400);

?>
