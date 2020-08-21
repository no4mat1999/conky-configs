#!/bin/bash

IP=127.0.0.1
PORT=6666
MUSIC_DIR="/home/virtual-luxury/Música"
ART_TEMPDIR="/home/virtual-luxury/.covers"
TEMP_DIR="/tmp"
TMP=/tmp/conkympd.tmp

file=$(mpc -h $IP -p $PORT current -f "%file%")
art=$MUSIC_DIR/$file

sonata_filename=$(echo $(mpc -h $IP -p $PORT current -f "%artist%-%album%") | sed 's/\///g')
FILENAME="$ART_TEMPDIR/$sonata_filename.jpg"
LYRICS="$ART_TEMPDIR/lyrics/$file.txt"

# echo $LYRICS

[ ! -f $TMP ] && touch $TMP
if [ "$(cat $TMP)" == "$FILENAME" ]; then
	# echo "Misma cancion"
	exit 0
else
	rm $TEMP_DIR/cover.jpg 2>/dev/null
	rm $TEMP_DIR/conkympd_lyrics.txt 2>/dev/null
	cp "$FILENAME" $TEMP_DIR/cover.jpg 2>/dev/null;
	cp "$LYRICS" $TEMP_DIR/conkympd_lyrics.txt 2>/dev/null;
	echo $FILENAME > $TMP
	#necesitas imagemagic
	#convert /tmp/cover.jpg -filter Gaussian -blur 0x3 -brightness-contrast -10x10 /tmp/cover-blur.jpg
	# echo "Cancion cambio"
fi
