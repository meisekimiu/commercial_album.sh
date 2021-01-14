# commercial_album.sh
My script for listening to The Residents' Commercial Album: pREServed Edition.

This shuffles all the songs (to an extent) and allows you to pick you want to listen to the full pREServed release or the original 40 album songs only. If you are a purist, you can use this script to listen to the album the way The Residents intended, which is to play each song 3 times in a row in order to emulate a full pop song.

## Setup
In order to run this script, you need to have a ripped copy of The Commercial Album pREServed Edition. Whether you rip into FLAC or MP3 (or Opus if you're some kind of FOSS nerd) doesn't matter, as long as you have each file start with the track number and end with the track title. Most CD rippers should do this automatically.

You will also need VLC Media Player installed, as this script queues up a randomized playlist in VLC without using the "random" setting.

To run the script, just put it in the directory with all your song files and execute it with the proper options.

## Options
Run `./commercial_album.sh -h` to see all the options in the script.

The `-3` flag will include each song 3 times in a row to emulate a full pop song, like The Residents suggest you do.

The `-p` flag removes any of the newfangled pREServed releases and only plays the original 40 songs in the album.

The `-w` flag shuffles When We Were Young as well. I think it makes a fitting closing track so this is disabled by default. Lets me know the album is actually over, you know?
