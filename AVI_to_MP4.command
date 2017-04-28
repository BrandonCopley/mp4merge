#**********INFO:**********
#
# This script must be copied into the folder containing the video files
# In order for this file to be executable you must run the following:
#
# chmod +x AVI_to_MP4.command
#
# This command will let the AVI_to_MP4 file run by double clicking it
#
# This file works for converting .AVI to .MP4 files
#
# This is useful for cameras like the Fly6 that record to .AVI
#
#*************************

#!/bin/bash

cd "$(dirname "$0")" #navigates to current directory

for file in *.AVI; do
  if ffmpeg -i $file -vcodec copy -an $file.mp4; then
    rm -rf $file;
  fi
done;
