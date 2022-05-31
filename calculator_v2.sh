#! /bin/bash 

## Functions 
# numerical validation
validate_num() { 
    if ! [[ "$1" =~ ^[0-9]+$ ]]; 
        then 
            echo "The number you've inputted is invalid. Please run the script again."
            exit 3 
    fi 
}

# validating andnaming operator 
name_operation() {
    case "$operator" in 
        "+") 
            operation='addition'
            output='sum' ;; 
        "-") 
            operation='subtraction'
            output='difference';;
        "*") 
            operation='multiplication'
            output='product';; 
        "/") 
            operation='division'
            output='quotient';;
        "%") 
            operation='modulo' 
            output='remainder';; 
        *) 
            echo "Invalid operator!"
            exit 3 ;;
    esac
}

# detecting input
detect_input() { 
    read -p "Please input your first number: " num1 
    validate_num $num1  
    read -p "Please input your second number: " num2 
    validate_num $num2
    read -p "Please input your operator: " operator
    name_operation 
}

# summarize input 
summarize_input() { 
    echo "Your numbers are ${num1} and ${num2}. Your desired operation is ${operation}."
}


# calculate and print result 
calc_print_res() { 
    res=$((${num1} ${operator} ${num2}))
    echo "The ${output} is ${res}." 
}

# input - summarize function 
prompt_calculate() { 
    detect_input 
    summarize_input
    calc_print_res
}


## Main body 
if (($# == 0)) ; 
    then 
        echo "No arguments detected. Please input them when prompted."
        prompt_calculate 
elif (($# != 3)) ; 
    then 
        echo "Incorrect number of arguments detected. Please respond to the following prompt."
        prompt_calculate 
else 
    num1=$1 
    num2=$2
    operator=$3
    validate_num ${num1} 
    validate_num ${num2} 
    name_operation 
    summarize_input 
    prompt_calculate
fi 