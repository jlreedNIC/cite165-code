#!/bin/bash
# Script to append to path variable


echo "What directory do you want to add to the PATH variable?"
read newpath
echo "You entered $newpath"

PATH=$PATH:newpath
export PATH
echo "Your PATH variable"
echo $PATH

exit 0
