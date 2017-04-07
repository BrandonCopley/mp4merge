#**********INFO:**********
#
#This script must be copied into the folder containing the video files
#In order for this file to be executable you must run the following:
#
#chmod +x mp4_merge.command
#
#This command will let the mp4_merge file run by double clicking it
#
#This file works for merging .mp4 .MP4 .AVI
#
#*************************

#!/bin/bash

cd "$(dirname "$0")" #navigates to current directory

echo “Files in this folder:“
ls

inputFilenameDefault=G*.MP4
read -p "Enter input filename [$inputFilenameDefault]: " inputFilename
inputFilename=${inputFilename:-$inputFilenameDefault}
echo "inputFilename is $inputFilename"

outputFilenameDefault=race.mp4
read -p "Enter output filename [$outputFilenameDefault]: " outputFilename
outputFilename=${outputFilename:-$outputFilenameDefault}
echo "outputFilename is $outputFilename"


#the concat operation
shift
ls $inputFilename | perl -ne 'print "file $_"' > concat.list
ffmpeg -f concat -i concat.list -c copy $outputFilename
rm concat.list
