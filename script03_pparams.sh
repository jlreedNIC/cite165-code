#!/bin/bash
# List of positional parameters

echo 'All parameters in a string = ' $*
echo 'All parameters in an array = ' $@

# The \n character will allow you to print a new 
# line to the terminal when paired with the -e
# option for the echo command.
echo -e "\nNow we can loop through the array:"
for ae in $@; do
    echo ' $@ element = ' $ae;
done

echo "This is the first argument: $1"
echo "This is the second argument: $2"

echo ''
echo '      Number of positional arguments = ' $#
echo '                Name of shell script = ' $0
echo 'Exit status of last executed command = ' $?
echo '  Option flags from last set command = ' $-
echo '   Last argument of previous command = ' $_
echo '                        PID of shell = ' $$
echo '          PID of last background job = ' $!
