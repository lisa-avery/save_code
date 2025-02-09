#!/bin/bash

# Set the source and destination directories. Replace with your actual paths.
## TO DO:
## 1. replace the name of the SOURCE directory
## 2. replace the name of the DESTINATION directory
## 3. updated/change the file EXTENSIONS to be included in the copy

SOURCE="path/to/source/directory"  # replace with source directory
DESTINATION="path/to/source/directory" # replace with destination directory
EXTENSIONS="*.qmd -o -name '*.Rmd' -o -name '*.R'"

# Check if source directory exists
if [ ! -d "$SOURCE" ]; then
  echo "Error: Source directory '$SOURCE' does not exist."
  exit 1
fi

# Check if destination directory exists. If not, create it.
if [ ! -d "$DESTINATION" ]; then
  mkdir -p "$DESTINATION"
  if [ $? -ne 0 ]; then #Check exit status of mkdir
    echo "Error: Could not create destination directory '$DESTINATION'."
    exit 1
  fi
fi


# Use find to locate files with .qmd and .Rmd extensions and copy them, preserving directory structure.
find "$SOURCE" -type f \( $EXTENSIONS \) -print0 | while IFS= read -r -d $'\0' file; do
  # Get the relative path of the file from the source directory.
  relative_path="${file#$SOURCE}"
  # Construct the destination path.
  destination_file="$DESTINATION${relative_path}"

  # Create the necessary subdirectories in the destination.
  destination_dir=$(dirname "$destination_file")
  mkdir -p "$destination_dir"

  # Copy the file. -p preserves timestamps and permissions
  cp -p "$file" "$destination_file"
  if [ $? -ne 0 ]; then #Check exit status of cp
    echo "Error copying $file"
  fi
done

echo "Copy process complete."
exit 0
