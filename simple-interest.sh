#!/bin/bash
# A simple shell script to calculate Simple Interest

echo "--- Simple Interest Calculator ---"

# Prompt for Principal amount
echo "Enter the Principal amount (e.g., 1000):"
read principal

# Validate if principal is a positive number
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || (( $(echo "$principal <= 0" | bc -l) )); then
    echo "Invalid principal amount. Please enter a positive number."
    exit 1
fi

# Prompt for Annual Interest Rate
echo "Enter the Annual Interest Rate (as a decimal, e.g., 0.05 for 5%):"
read rate

# Validate if rate is a positive number
if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || (( $(echo "$rate <= 0" | bc -l) )); then
    echo "Invalid interest rate. Please enter a positive number."
    exit 1
fi

# Prompt for Time in years
echo "Enter the Time in years (e.g., 3):"
read time

# Validate if time is a positive number
if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]] || (( $(echo "$time <= 0" | bc -l) )); then
    echo "Invalid time. Please enter a positive number."
    exit 1
fi

# Calculate Simple Interest: Interest = Principal * Rate * Time
# Using 'bc' for floating-point arithmetic
interest=$(echo "scale=2; $principal * $rate * $time" | bc)

echo "----------------------------------"
echo "Calculated Simple Interest: $"$interest
echo "----------------------------------"
