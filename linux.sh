#!/bin/bash
# Prompt the user to enter a number for the multiplication table 
read -p "Enter a number: " number

# Check if the user input is a valid number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input, please enter a valid number" 
  exit 1
fi

# Ask if they want a full table or a partial table
echo "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial)"
read table_choice

if [ "$table_choice" == "f" ]; then
    # Generate the full multiplication table in ascending order
    echo "Multiplication table for $number (Ascending):"
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
 
  # Validate the range
  if [ "$start_number" -le "$end_number" ]; then
    echo "Partial Multiplication table for $number from $start_number to $end_number (Ascending order)."
    for i in $(seq $start_number $end_number); do
      result=$((number * i ))
      # Display result for partial table
      echo "$number x $i = $result" 
    done
  else 
    echo "Invalid range. The start number must be less than or equal to the end number."
      for i in {1..10}; do
        result=$((number * i))
        # Display result for the full table
        echo "$number x $i = $result"
      done  
  fi
else
    echo "Invalid table choice."
fi
