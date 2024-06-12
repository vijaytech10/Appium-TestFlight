import subprocess
import time
from datetime import datetime, timedelta
import argparse

# Define the 'core action' shell script path from the 'test scripts utility' directory
core_action_script = "/Users/vijayakc/Test_Scripts/utility/autobot_test_runner.sh" #sample

# Define the default execution time (7:00 AM)
default_execution_time = datetime.now().replace(hour=7, minute=0, second=0, microsecond=0) + timedelta(days=1)

# Creating an argument parser to accept a custom execution time
parser = argparse.ArgumentParser(description="Scheduled script executor")
parser.add_argument(
    "--custom-time",
    help="Specify a custom execution time in HH:MM format (e.g., 17:50)",
    default=default_execution_time.strftime("%H:%M"),
)

args = parser.parse_args()
custom_time_str = args.custom_time

try:
    # Parse the custom execution time provided as a command-line argument
    custom_time = datetime.strptime(custom_time_str, "%H:%M")
    
    # Calculate the next execution time based on the provided custom time
    next_execution_time = datetime.now().replace(hour=custom_time.hour, minute=custom_time.minute, second=0, microsecond=0)
    
    # If the provided custom time is in the past, set it for the same time on the following day
    if next_execution_time <= datetime.now():
        next_execution_time += timedelta(days=1)
    
    while True:
        current_time = datetime.now()
        
        # Check if it's time to execute the core action script
        if current_time >= next_execution_time:
            print("Executing core action script...")
            
            # Run the core action shell script
            subprocess.run(["sh", core_action_script])
            
            # Update the next execution time for the following day
            next_execution_time += timedelta(days=1)
        
        else:
            # Calculate the time remaining until the next execution
            time_remaining = next_execution_time - current_time
            print(f"Waiting for next execution scheduled at {next_execution_time.strftime('%d-%b-%y %H:%M')} (in {time_remaining.seconds // 3600} hours and {(time_remaining.seconds // 60) % 60} minutes)...")
            
            # Sleep for 1 minute
            time.sleep(60)

except ValueError:
    print("Invalid custom time format. Please use HH:MM format (e.g., 17:50).")
