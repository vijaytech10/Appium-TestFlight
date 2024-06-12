# #!/bin/bash

# Define the package name of the app
app_name="com.amazon.dee.app"

# Run the 'adb shell dumpsys package' command to get package information
package_info=$(adb shell dumpsys package "$app_name")

# Check if the package information contains the "versionName" field
if [[ $package_info =~ "versionName="([^\s]+) ]]; then
  # Extract the versionName value
  app_version="${BASH_REMATCH[1]}"
  app_version="${app_version%?}"
  echo "$app_version"
else
  echo "$app_name unavailable"
fi
