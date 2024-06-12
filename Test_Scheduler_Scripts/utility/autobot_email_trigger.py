import os
import smtplib
import subprocess
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication
import time
import datetime
import sys

# Define the 'root' and 'test scripts' directory for fetching 'get_app_version' & 'report_header.html' css file
root_dir = "/Users/vijayakc/autobot/matrix/treetopSocial" #sample
utilities_dir = "/Users/vijayakc/autobot/matrix/treetopSocial/src/TreeTopAlexaSocialTests/utilities" #sample


def get_app_version():
    '''
    This function will fetch the android Alexa app version of the connected device using the shell script 'get_app_version.sh'.
    '''
    # Executing shell script to get the app version
    result = subprocess.run(['/bin/bash', os.path.join(utilities_dir, 'get_app_version.sh')], stdout=subprocess.PIPE, text=True)
    app_version = result.stdout.strip()
    return app_version

def prepend_header_to_report(header_file_path, report_file_path):
    '''
    This function prepends the content of the header HTML file to the report HTML file.
    '''
    # Read the content of the header HTML file
    with open(header_file_path, 'r') as header_file:
        header_content = header_file.read()

    # Read the content of the report HTML file
    with open(report_file_path, 'r') as report_file:
        report_content = report_file.read()

    # Combine the header and report content
    combined_content = header_content + report_content

    # Write the combined content back to the report file
    with open(report_file_path, 'w') as report_file:
        report_file.write(combined_content)

def send_email(folder_path):
    '''
    This function will send the email updated with Android App version, along with the HTML report attachments 
    from 'folder_path' passed as argument.
    '''
    # Get the app version
    app_version = get_app_version()

    # Email configuration
    sender_email = "sharing-mobile-automation-reports@gmail.com"
    recipient_email = "vijayakumarc@outlook.com"
    current_date = datetime.datetime.now().strftime('%d-%b-%y')
    subject = f"Build No.# {app_version}: Sharing Mobile Test Automation Report for Android, {current_date}"
    body = f"Hi Team,\n\nPlease find attached the 'Automated Mobile Test Execution Report' from 'Comms Sharing' regression test suite.\n\n* Date: {current_date}.\n * Device Platform: Android\n * Alexa Mobile App Version: {app_version}.\n\nFor any queries related to test run, Kindly reach out to vijayakumarc@outlook.com \n\nNote: Please do not reply directly to this unmonitored email alias.\n\nRegards,\nVijay"

    # Verify if folder_path exists and is a directory
    if not os.path.exists(folder_path) or not os.path.isdir(folder_path):
        print(f"Error: {folder_path} is not a valid directory.")
        exit(1)

    # Create an email message
    msg = MIMEMultipart()
    msg['From'] = sender_email
    msg['To'] = recipient_email
    msg['Subject'] = subject

    # Add the email body
    msg.attach(MIMEText(body, 'plain'))

    # Attach HTML report files from the configured folder path
    for filename in os.listdir(folder_path):
        if filename.endswith(".html"):
            file_path = os.path.join(folder_path, filename)
            
            # Prepend the header HTML content to the report file
            prepend_header_to_report(os.path.join(utilities_dir, 'report_header.html'), file_path)
            
            # Attach the modified report file to the email
            with open(file_path, 'rb') as file:
                attachment = MIMEApplication(file.read(), _subtype="html")
                attachment.add_header('Content-Disposition', 'attachment', filename=filename)
                msg.attach(attachment)

    # Send the email
    try:
        server = smtplib.SMTP("mail-relay.outlook.com")
        server.starttls()
        # server.login(sender_email, sender_password)
        server.sendmail(sender_email, recipient_email, msg.as_string())
        server.quit()
        print("Email sent successfully!")
    except Exception as e:
        print("Failed to send email:", str(e))

def main():
    # Check if a command-line argument for folder_path is provided
    # Accepted Parameters : 1. daily (or) 2. specific report folder path 
    if len(sys.argv) == 1:
        print("Alert: Argument Missing, Please provide required parameter to initiate email trigger process (i.e) a.daily <or> b.report-folder-path")
        exit(1)
    elif sys.argv[1] == "daily":
        # When the argument provided is "daily," construct the path based on the current date
        current_date = datetime.datetime.now().strftime('%d-%b-%y')
        folder_path = os.path.join(root_dir, "build/TreeTopAlexaSocialTests/TreeTopAlexaSocialTests-1.0/AL2_x86_64/DEV.STD.PTHREAD/build/matrix-reports/daily-reports", current_date)
    else:
        # Use the provided folder_path argument
        folder_path = sys.argv[1]

    # Call the send_email function with the determined folder_path
    send_email(folder_path)

if __name__ == "__main__":
    main()
