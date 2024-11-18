#!/bin/bash
# A bash script to interact with a fake pet. 
# Show cases multiple variable use cases and control statements.

# Initialize pet stats
declare -i energy=10
declare -i happiness=10
declare -i hunger=10

# Function to display the current stats of the pet
display_stats() {
    echo "Energy: $energy"
    echo "Happiness: $happiness"
    echo "Hunger: $hunger"
}

# What kind of pets can we choose from
pet_options=(cat dog bird fish zebra)

choose_pet() {
    # loop through user input until the user gives valid input
    declare -i goodAnswer=1
    while [ $goodAnswer -eq 1 ]
    do
        echo "Choose the pet you want:"
        # loop through pet_options list and print out
        for ((i=0; i<${#pet_options[@]}; i++)); do
            echo " ($i) ${pet_options[$i]} "
        done
        echo " (e) Exit"

        # print out text to the screen and accept input
        read -p "Enter the number of your choice: " pet_choice

        # handle user input
        # if user chose 'e', exit program
        if [ $pet_choice = 'e' ]; then
            echo "goodbye!"
            exit 0
        # if user chose an option less than 5, it's a valid choice
        # set our pet variable and escape the while loop
        elif [ $pet_choice -lt ${#pet_options[@]} ]; then
            pet=${pet_options[$pet_choice]}
            echo "You chose a $pet!"
            goodAnswer=0
        # everything else is invalid
        else
            echo "Invalid option. Try again"
        fi
    done
}

# feed pet
feed_pet() {
    echo "You fed the pet some food!"
    
    # Increase energy and happiness based on food
    energy=$((energy + 5))
    happiness=$((happiness + 3))
    
    # Ensure energy and happiness do not exceed maximum values
    if ((energy > 10)); then energy=10; fi
    if ((happiness > 10)); then happiness=10; fi
}

# Function to play with the pet
play_with_pet() {
    echo "You played with your $pet!"
    energy=$((energy - 3))
    happiness=$happiness+5

    # make sure energy does not go below minimum
    if ((energy < 0)); then 
        energy=0; 
    fi

    # make sure happiness does not go above maximum
    if ((happiness > 10)); then 
        happiness=10; 
    fi
}

# function to put pet to sleep and regain energy
make_sleep() {
    echo "You put your pet in bed to sleep."

    # set stats
    energy=10
    happiness=happiness+3
    hunger=hunger-1

    # ensure happiness and hunger don't exceed maximum and minimum
    if [ $happiness -gt 10 ]; then
        happiness=10
    fi

    if [ $hunger -lt 0 ]; then
        hunger=0
    fi
}

# Function to check if the pet stats have reached the minimum values
check_stats() {
    if [ $happiness -eq 0 ]; then
        echo "Your pet is so sad! You should play with it."
    fi

    if ((hunger==0)); then
        echo "Your pet is starving! You should feed it!"
    fi

    if ((energy==0)); then
        echo "Your pet is too tired! Put it to bed."
    fi
}

# main game loop
# what can we do with our pet?
game_loop() {
    # we loop until we exit the script
    while true; do
        echo -e "\nWhat do you want to do?"
        echo " (1) Feed $pet"
        echo " (2) Play with $pet"
        echo " (3) Show pet's stats"
        echo " (4) Put $pet to bed"
        echo -e "\n (0) Exit"

        read -p "Enter your choice: " pet_choice

        # case statement to handle multiple conditions
        # more condense and readable than mutiple if else statements
        case $pet_choice in
            0)  echo "Goodbye!"
                exit 0
                ;;
            1)  feed_pet ;;
            2)  play_with_pet ;;
            3)  display_stats ;;
            4)  make_sleep ;;
            *)  echo "That option is not available. Try again." ;;
        esac
    
        check_stats
    done 
}

# --- Main game loop ---
advanced_pet_options
game_loop
