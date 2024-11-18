#!/bin/bash
# Example of case statement and while loop

shopt -s nocasematch

goodAnswer=1
while [ $goodAnswer -eq 1 ];
do
    echo "Enter the name of a month."
    read month

    case $month in
        February )
            echo "There are 28/29 days in $month." 
            goodAnswer=0
            ;;
        April | June | September | November )
            echo "There are 30 days in $month."
            goodAnswer=0
            ;;
        January | March | May | July | August | October | December)
            echo "There are 31 days in $month."
            goodAnswer=0
            ;;
        * )
            echo "Unknown month. Please check if you entered the correct month name: $month";;
    esac
done