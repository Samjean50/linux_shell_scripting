# Capstone Project - Linux Shell Scripting

## Capstone Project: Bash Script for Generating a Multiplication Table

### 1. Project Overview

This project involves the creation of a Bash script that generates a multiplication table for a number entered by the user. The script prompts the user to input a number and then choose between viewing a full multiplication table (from 1 to 10) or a partial table within a user-defined range. Based on the user's selection, the corresponding multiplication table is displayed.

This implementation demonstrates the use of loops, user input handling, and conditional logic in Bash scripting.

### 2. Project Steps

#### 2.1. Create Project Directory

A dedicated project directory was set up to store all relevant project files.

* Command:  
    ```bash
    touch multiplication_table.sh
    ```

![Create directory](images/create-directory.png)

#### 2.2. Initialize Git Repository

A Git repository was initialized in the project directory to track changes and manage version control.

* Command:  
    ```bash
    git init
    ```

#### 2.3. Create a Bash Script File (.sh)

A shell script file named `multiplication_table.sh` was created to hold the Bash code.

* Command:  
    ```bash
    touch multiplication_table.sh
    ```

![Create file](images/create-file.png)

#### 2.4. Make the Script Executable

The script was made executable by updating the file permissions.

* Command:  
    ```bash
    chmod +x multiplication_table.sh
    ```

![Make executable](images/makescript-executable.png)

#### 2.5. Set Up GitHub Repository and Link Remote

A remote repository was created on GitHub, and the local repository was linked to it.

![Setup Github Repository](images/git_repository.png)

---

### 3. Script Implementation

#### 3.1. Prompt for User Input

The script prompts the user to enter a number using the `read -p` command.

```bash
read -p "Enter a number: " number
```

#### 3.2. Ask for Table Type (Full or Partial)
 * Ask the user if they want a full multiplication table (1-10) or a partial one within a specific range.
```sh
echo "Do you want a full table or a partial table?
(Enter 'f' for full, 'p' for partial)"
read table_choice
```
![Setup Github Repository](https://github.com/Samjean50/linux_shell_scripting/blob/main/images/doyou.png)

#### 3.3. Full Multiplication Table
* If the user selects the full table option (f), display the multiplication table from 1 to 10 in ascending order.
```sh
if [ "$table_choice" == "f" ]; then
"Multiplication table for $number (Ascending):"
# Generate the full multiplication table in ascending order
  for i in {1..10}; do
    result=$((number * i))
    # Display result for the full table
    echo "$number x $i = $result"
  done
  ```
![Full table](https://github.com/Samjean50/linux_shell_scripting/blob/main/images/full%20table.png)

#### 3.4. Partial Multiplication Table
* If the user chooses the partial option (p), prompt for a custom range (start and end numbers).
```sh # Validate the range
  if [ "$start_number" -le "$end_number" ]; then
    echo "Partial Multiplication table for $number from $start_number to $end_number (Ascending order)."
    for i in $(seq $start_number $end_number); do
      result=$((number * i ))
      # Display result for partial table
      echo "$number x $i = $result"
    done
  else
    echo "Invalid range. The start number must be less than or equal to the end number."
fi
```

![Partial table](https://github.com/Samjean50/linux_shell_scripting/blob/main/images/partial%20table.png)

### 4. Troubleshooting (Common Issues and Solutions)
#### 4.1. Script Permission Denied
- If you encounter a “Permission Denied” error when running the script, ensure the script has executable permissions.
* Solution: ```Run chmod +x multiplication_table.sh``` to make the script executable.
#### 4.2 Invalid Input for Number
- If the user enters a non-numeric value, the script may behave unexpectedly as it expects a number for multiplication.
* Solution: Add input validation to ensure that only numbers are accepted. For example:

```sh 
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
echo "Invalid input. Please enter a valid number."
exit 1
fi
```
#### 4.3. Invalid Range in Partial Table
- If the user inputs a start number greater than the end number, the script will display an "Invalid range" error.
* Solution: Make sure the start number is less than or equal to the end number, as shown in the range validation code.
#### 4.4. Git Remote Connection Issues
- If you have trouble pushing code to the GitHub repository, verify that the remote URL is correct and that you have the necessary permissions.
* Solution: Run git remote -v to check the remote URL and verify access. If there are issues, re-add the remote with the correct URL using git remote add origin <repository_url>.
