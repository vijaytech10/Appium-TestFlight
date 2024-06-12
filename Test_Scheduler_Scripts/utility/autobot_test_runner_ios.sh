#!/bin/bash

# Enable debugging mode
set -x

# # Function to kill Appium process
# kill_appium_process() {
#     # Identify the currently running Appium process and kill it
#     appium_pid=$(ps aux | grep -i "[a]ppium -a 0.0.0.0 -p 4723" | awk '{print $2}')
#     if [ -n "$appium_pid" ]; then
#         echo "Killing Appium process (PID $appium_pid)..."
#         kill -9 "$appium_pid"
#     fi
# }

# Configure the root directory "treetopSocial" for repo update and test execution
# ROOT_DIR=/Users/vijayakc/CR_Temp_Local_Package/Other_Backup/iOS_Hashed_out_cases/treetopSocial #sample
# UTILITIES_DIR=/Users/vijayakc/Test_Scripts/utility #sample
ROOT_DIR=/Users/vijayakc/treetop_alexasocial #sample
UTILITIES_DIR=/Users/vijayakc/Test_Scripts/utility #sample

# # Check if Appium is running
# # Note: 'Device ID' update is required based on the connected test device i.e., qsyleufuizdepfnz
# if ! ps aux | grep -q "[a]ppium -a 0.0.0.0 -p 4723"; then
#   echo "Appium is not running. Starting Appium..."
#   appium -a 0.0.0.0 -p 4723 --default-capabilities '{"udid":"74EE9D7D-3335-418F-82DF-BC553C2FDEC0"}' --relaxed-security --long-stacktrace --log-timestamp --local-timezone --log-level debug:debug --log /appium.log > /dev/null 2>&1 &
#   # Sleep for a few seconds to allow Appium to start
#   sleep 5
# fi

# # Check and confirm if the device is connected
# # Note: 'Device ID' update is required based on the connected test device i.e., qsyleufuizdepfnz
# if ! /opt/homebrew/bin/adb devices | grep -q "74EE9D7D-3335-418F-82DF-BC553C2FDEC0"; then
#   echo "Unable to detect the connected device. Retrying..."
  
#   # Kill the existing Appium process
#   kill_appium_process
  
#   # Retry starting Appium
#   appium -a 0.0.0.0 -p 4723 --default-capabilities '{"udid":"74EE9D7D-3335-418F-82DF-BC553C2FDEC0"}' --relaxed-security --long-stacktrace --log-timestamp --local-timezone --log-level debug:debug --log /appium.log > /dev/null 2>&1 &
  
#   # Sleep for a few seconds to allow Appium to start
#   sleep 5
  
#   # Check if Appium started successfully after retry
#   if ps aux | grep -q "[a]ppium -a 0.0.0.0 -p 4723"; then
#     echo "Appium started successfully after retry."
#   else
#     echo "Failed to start Appium after retry. Exiting..."
#     exit 1
#   fi
# fi

# # Initiating the latest code fetch from the mainline repository (Path to be updated)
# echo "1. Navigate to "TreeTopAlexaSocialTestPages" to perform git pull & rebase"
# #Navigate to test directory based on defined root directory
# cd "$ROOT_DIR/src/TreeTopAlexaSocialTestPages"
# #Performing git pull process 
# git pull --rebase
# #waiting for 30 Secs before the next process
# sleep 30
# #Initiating brazil build process
# brazil-build

echo "2. Navigate to "TreeTopAlexaSocialTests" to perform git pull & rebase"
#Navigate to test directory based on defined root directory
cd "$ROOT_DIR/src/TreeTopAlexaSocialTests"
# #Performing git pull process 
# git pull --rebase
# #waiting for 30 Secs before the next process
# sleep 30
# #Initiating brazil build process
# brazil-build

# Set the base directory path for test reports
BASE_REPORT_DIR="$ROOT_DIR/build/TreeTopAlexaSocialTests/TreeTopAlexaSocialTests-1.0/AL2_x86_64/DEV.STD.PTHREAD/build/matrix-reports/daily-reports"

# Get the current date in the desired format (e.g., "11-sep-23")
CURRENT_DATE=$(date '+%d-%b-%y')

# Create a new directory for the current date if it doesn't exist
mkdir -p "$BASE_REPORT_DIR/$CURRENT_DATE"

# Path to the external file containing test input combinations updated based on root directory definition.
# Sample combination to be updated in file (i.e.) RZCT31D6ZVE::test_P0_dedicated_profile_sharing_cases_sender_01.py::TEST_ACCOUNT_SHARING_US_001::Android
# Test accounts to be updated based on configurations made in "/src/tree_top_alexa_social_tests/constants/test_accounts.py"
TEST_COMBINATIONS_FILE="$UTILITIES_DIR/test_input_combinations_ios.txt"

# Read each line from the file and execute tests for each combination
while IFS= read -r line; do
  # Extract the parameters from the .txt file
  test_file=$(echo "$line" | cut -d':' -f1)
  test_account_keys=$(echo "$line" | cut -d':' -f2)
  device_keys=$(echo "$line" | cut -d':' -f3)

  # Remove the .py extension from test_file
  test_file_no_extension="${test_file%.py}"

  # Generate a unique identifier for this run (i.e. "test_P0_QnA_sharing_sender_side_test_cases_iteration_184305")
  RUN_IDENTIFIER="${test_file_no_extension}_$(date '+%H%M%S')"

  # Set the path for the HTML report
  HTML_REPORT_PATH="$BASE_REPORT_DIR/$CURRENT_DATE/$RUN_IDENTIFIER.html"

  # Initiating execution via brazil CLI and generate HTML report after test run completion.
  echo "Initiating Test run execution via CLI"
  brazil-test-exec py.test test/sharing_tests/"$test_file" --test-account-keys="$test_account_keys" --device-keys="$device_keys" -s -v --html="$HTML_REPORT_PATH" --simulator
  echo "Test run initiated"

done < "$TEST_COMBINATIONS_FILE"

# # To initiate the Email trigger process (Path to be updated)
# echo "Initiating Email Trigger..."
# python3 $UTILITIES_DIR/autobot_email_trigger.py daily
# echo "Email sent successfully!"

# Wait for the email script to finish sending emails (you can adjust the sleep duration)
sleep 60

# Disable debugging mode
set +x
