#!/bin/bash

# Pokémon API URL for Pikachu
API_URL='https://pokeapi.co/api/v2/pokemon/25/'
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

response=$(curl -s -w "%{http_code}" $API_URL)

echo "Fetching data from $API_URL..."
http_code=${response: -3}
echo "HTTP Status Code: $http_code"


if [ "$http_code" -eq 200 ]; then
    echo "$response" > "$OUTPUT_FILE"
    echo "Successfully saved Pikachu data to $OUTPUT_FILE"
else
    error_message="Error fetching Pikachu data: HTTP status code $http_code"
    echo "$error_message" >> "$ERROR_FILE"
    echo "$error_message" >&2
fi