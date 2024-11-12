#!/bin/bash

# list of positional parameters

echo 'All parameters in a string = ' $*
echo 'All parameters in an array = ' $@

echo -e "\nNow we can loop through the array:"
for ae in $@; do
    echo ' $@ element = ' $ae;
done

echo ''
echo '      Number of positional arguments = ' $#
echo '                Name of shell script = ' $0
echo 'Exit status of last executed command = ' $?
echo '  Option flags from last set command = ' $-
echo '   Last argument of previous command = ' $_
echo '                        PID of shell = ' $$
echo '          PID of last background job = ' $!
