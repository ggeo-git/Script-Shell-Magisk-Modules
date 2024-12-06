#!/bin/bash

# Directory where the modules are located
MODULES_DIR="/storage/emulated/0"  # Change to your path

# Navigate to the modules directory
cd "$MODULES_DIR" || { echo "Directory not found"; exit 1; }

# Loop to install each .zip module
for module in *.zip; do
    if [ -f "$module" ]; then
        echo "Installing module: $module"
        magisk --install-module "$module"
        
        # Check if the installation was successful
        if [ $? -eq 0 ]; then
            echo "Module $module installed successfully."
        else
            echo "Failed to install module $module."
        fi
    else
        echo "No modules found for installation."
    fi
done

echo "Module installation completed."