<?php

//Default password is "root" with md5 hash
//No "/" at the end of outputFolder or logfolder


// im sorry ive never programmed in PHP

if (getenv('MAX_DL') == false )  {
	$max_dl = 3
} else {
	$max_dl = getenv('MAX_Dl')
}

return array(
	"bin" => "/usr/local/bin/yt-dlp",
	"security" => true,
	"password" => "63a9f0ea7bb98050796b649e85481845",
	"outputFolder" => "downloads",
	"extracter" => "ffmpeg",
	"log" => true,
	"outfilename" => "%(title)s-%(id)s.%(ext)s",
	"logFolder" => "logs",
	"max_dl" => 3,
	"session_lifetime" => 86400);

?>