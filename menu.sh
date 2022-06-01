#! /bin/bash 

echo "1. Show disk usage." 
echo "2. Show system uptime."
echo "3. Show the users logged into the system."
read -p "What would you like to do? (Enter q to quit.)" action 

case $action in
    1) du ;; 
    2) uptime ;; 
    3) w ;; 
    q) echo "Goodbye!" 
        exit 1 ;; 
    *) echo "Invalid input" ;; 
esac 

