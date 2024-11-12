#!/bin/bash
# Demonstrating user variables

# We can create variables when we assign a value
variable=value      # when no spaces, we can declare it this way
newVariable="there is some value here"      # when there are spaces, we need to wrap in quotes " or '

# We reference variables with $
echo $variable      # prints out value of variable
echo variable       # prints out variable

# can also reference a variable inside of ""
echo "value of newVariable is: $newVariable"
echo 'this prints the string: $newVariable'

# We can create variables with the read command
# echo "Input your name"
# read fullname
# echo "Your name is $fullname"

# The above is used for creating variables dynamically
# Not every programming lanuage allows for this
# We can also declare variables ahead of time, and specify their type
declare firstname="Jordan"      # just declares variable
declare -i integer=4            # declares an integer variable

echo '$firstname=' $firstname
echo '$integer=' $integer

# We can also delete/unset variables
unset firstname
echo "unset firstname: $firstname"

# Integer variables are natural numbers, counting numbers, e.g. 0,1,2,3,...
# Used in shell arithmetic
# note, integer variables are still stored as text, but shell knows it can be used in arithmetic operations
# shell handles converting to number if able
x=4
echo $x
declare -i y=6
echo $y

# arithmetic operations
# no spaces! or shell won't process correctly
# +,-,*,/
declare -i z=x+y        # cannot just say z=x+y, this will make it store string x+y
echo "x+y=$z"
z=x-y                   # can do negative numbers just fine
echo "x-y=$z"
z=x*y
echo "x*y=$z"
z=y/x                   # integer arithmetic, cannot do decimals so it truncates it
echo $z

# z is declared integer, but if we assign a string, it'll output 0
# strings in shell arithmetic are evaluated to 0
z=John
echo "string z = $z"

a=Bob
z=a+6
echo "Bob + 6 = $z"

# Array variables
# We can assign multiple values to one variable using arrays
# these are like lists
# we declare them with -a and -A

# indexed array, declare with -a
# means indices are numbers: 0,1,2,...
declare -a namearray=(Jordan Sam Craig Miles)

# referencing array is done with {} (known as parameter expansion or variable expansion)
# talked about later
# indices start with 0, so second value is done with [1]
echo "second value in array ${namearray[1]}"

# can dynamically add values to array
namearray[7]=Tabitha
echo "new value in array ${namearray[7]}"

# associative array
# indices don't have to be numbers
declare -iA agearray=([Bob]=30 [Joe]=50 [Sue]=21 [Jane]=5)  # remember, -i allows for arithmetic operations
echo "age of Jane ${agearray[Jane]}"

# keep in mind, integer variables don't need ${} if in arithmetic operation
declare -i combined=agearray[Bob]+agearray[Jane]
echo $combined

# ---- Expansion ----
# variable expansion
echo ${agearray[Sue]}

# we can add operators to our expansion
location="ID 83856"
# this will print out a substring of our location variable starting at location 3
# remember, indexing starts with 0
echo "substring expansion: ${location: 3}"

# can also specify an ending location
location="1000 W Garden Ave, Coeur d'Alene, ID 83814"
echo "more substring expansion: ${location: 18:30}"

# we can do pattern substitution
echo ${location/83814/99216}    # searches string in location for string 83814 and replaces it with 99216

# Command substitution
# done with $()
# commands in () are executed and substituted with output
# can use as argument for another command or to set a variable
lastfriday=$(date --date="last Friday")
echo "File backed up on $lastfriday"

# can also use backticks
lastthursday=`date --date="last Thursday"`
echo "with backticks    $lastthursday"

exit 0
