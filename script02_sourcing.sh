#!/bin/bash
# Script to append to path variable

# Run this script then type echo $PATH in your terminal 
# to see the difference. This shows that changes to 
# your environment done by a script are not permanent.

echo "What directory do you want to add to the PATH variable?"
read newpath
echo "You entered $newpath"

PATH=$PATH:newpath
export PATH
echo "Your PATH variable"
echo $PATH

exit 0
