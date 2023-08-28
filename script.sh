#!/bin/bash

# This script processes images in a directory by resizing them if they are larger than a specified maximum width.

# Read parameters from JSON file
maxWidth=$(jq -r '.maxWidth' parameters.json) # Read the 'maxWidth' value from the JSON file using the 'jq' tool
imagesDir=$(jq -r '.imagesDir' parameters.json) # Read the 'imagesDir' value from the JSON file using 'jq'

# Function to process an individual image file
processImageFile() {
  local path="$1" # Store the path of the image file
  local maxWidth="$2" # Store the maximum width

  width=$(identify -format "%w" "$path") # Get the width of the image using the 'identify' command
  if (( width > maxWidth )); then # Check if the width is greater than the maximum width
    newWidth=$((maxWidth)) # Set the new width to the maximum width
    newHeight=$((($(identify -format '%h' "$path") * newWidth) / width)) # Calculate the new height to maintain aspect ratio
    
    convert "$path" -resize "${newWidth}x${newHeight}" "$path" # Resize the image using the 'convert' command
    
    if [ $? -ne 0 ]; then # Check if the 'convert' command was successful
      echo "Error processing file $path" # Print an error message
    else
      echo "Processed file $path" # Print a success message
    fi
  else
    echo "Skipped file $path" # Print a message indicating the image was skipped
  fi
}

# Function to process a directory
processDirectory() {
  local path="$1" # Store the path of the directory

  for item in "$path"/*; do # Loop through items in the directory
    if [ -d "$item" ]; then # Check if the item is a directory
      processDirectory "$item" # Recursively call the function for subdirectories
    else
      if [[ "$item" =~ \.(jpg|jpeg|png|webp)$ ]]; then # Check if the item is an image file with supported extensions
        processImageFile "$item" "$maxWidth" # Call the image processing function for the image file
      fi
    fi
  done
}

# Call the main function with the current working directory
processDirectory "./$imagesDir" # Start processing the images in the specified directory
