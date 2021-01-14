#!/bin/bash
THREE=0
YOUNG=0
PRES=0
for var in "$@"
do
	if [[ "$var" == "--help" ]] || [[ "$var" == "-h" ]] ; then
		echo "Commercial Album Player"
		echo "Plays The Commercial Album as truly intended."
		echo "Well, technically it plays it the way that I think is the best. Use flags -3 and -w to listen to it as actually intended."
		echo
		echo "Usage: ./commercial_album.sh [OPTIONS]"
		echo "Options:"
		echo -e "  -h,--help\tShows this help message"
		echo -e "  -3\tPlays each song 3 times. (Not enabled by default)"
		echo -e "  -w\tShuffles 'When We Were Young' too. (Not enabled by default)"
		echo -e "  -p\tDoes not include pREServed release songs. (Not enabled by default)"
		exit
	fi
	if [[ "$var" == "-3" ]] ; then
		THREE=1
	fi
	if [[ "$var" == "-w" ]] ; then
		YOUNG=1
	fi
	if [[ "$var" == "-p" ]] ; then
		PRES=1
	fi
done
TRACKS=$(ls *.flac *.mp3 *.opus *.ogg 2>/dev/null | shuf)
if [[ "$PRES" == "1" ]] ; then
	TRACKS=$(ls *.flac | grep -v '[4|5][1-9]' | grep -v '50' | shuf)
fi
if [[ "$YOUNG" == "0" ]] ; then
	TRACKS=$(echo "$TRACKS" | grep -v "Young" | grep -v "Concentrate")
	TRACKS=$(echo -e "$TRACKS\n$(ls 40*)\n$(ls 53*)")
fi

if [[ "$THREE" == "1" ]] ; then
	TRACKLIST="$TRACKS"
	TRACKS=""
	while read -r track
	do
		TRACKS="$TRACKS$(echo -e "\n$track\n$track\n$track\n")"
	done <<< "$TRACKLIST"
fi
echo "$TRACKS" | xargs -0 -d "\n" vlc
