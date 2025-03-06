#!/bin/bash
# Prompt the user to enter a number for the multiplication table 
read -p "Enter your number: " number

# Check if the user input is a valid number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input, please enter a valid number" 
  exit 1
fi

# Ask if they want a full table or a partial table
echo "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial)"
read table_choice

if [ "$table_choice" == "f" ]; then
  for i in {1..10}; do
    result=$((number * i))
    # Display result for the full table
    echo "$number x $i = $result"
  done
elif [ "$table_choice" == "p" ]; then
  # Prompt the user to enter a number for the start and end of the range
  read -p "Enter your start_number: " start_number
  read -p "Enter your end_number: " end_number

# Check if the user input is a valid number
if ! [[ "$start_number" =~ ^[0-9]+$ ]] || ! [[ "$end_number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input, please enter a valid number"
  exit 1
fi
 
  echo "Partial Multiplication table for $number from $start_number to $end_number"  
  if [ "$start_number" -le "$end_number" ]; then
    for i in $(seq $start_number $end_number); do
      result=$((number * i ))
      # Display result for partial table
      echo "$number x $i = $result" 
    done
  else 
    echo "Invalid range."
      for i in {1..10}; do
        result=$((number * i))
        # Display result for the full table
        echo "$number x $i = $result"
      done  
  fi
else
    echo "Invalid table choice."
fi
