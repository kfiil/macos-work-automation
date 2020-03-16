#!/bin/bash
for file in *.scpt; do 
  cp "$file" "/Users/$USER/Library/Scripts/Automation/$file"
done