#!/bin/bash
# This script is for converting ts files to mkv using the h265 video and the ac3 audio-codec.
for i in *.ts
do
	ASPECT=`mediainfo "$i" | grep Display | cut -d" " -f25`
	WIDTH=`mediainfo "$i" | grep Width | cut -d" " -f38`
        HEIGHT=`mediainfo "$i" | grep Height | cut -d" " -f37`

	ffmpeg -i "$i" -c:v libx265 -s ${WIDTH}x${HEIGHT} -aspect $ASPECT -c:a ac3 -preset ultrafast -crf 18 "${i%.*}.mkv"
done