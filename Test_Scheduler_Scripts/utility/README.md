** Autobot - TreeTop Automation Utility - Readme **

Welcome to the Autobot Automation Utility! This set of scripts and files is designed to assist in automating sharing mobile tests and email notifications. These utilities will help to streamline test execution workflow and improve communication within team.
 
Here is a short description of each file in this repository:

* autobot_test_scheduler.py :- This python script utility helps schedule and automate the execution of tests at specified intervals. It ensures that tests are executed regularly without manual intervention.

* autobot_test_runner.sh :- This shell script facilitates the execution of test cases or test suites. It will fetch the assigned tests from "test_input_combinations.txt", generate test reports and trigger automated emails with daily reports attached appended with the Android app version used for execution. 

* autobot_email_trigger.py :- This Python script is responsible for triggering email notifications. It can be configured to send notifications to relevant stakeholders. It can also be consumed on a standalone mode by parsing the folder path as an argument. 

* get_app_version.sh :- This shell script extracts the Alexa App version information from the android device connected to the host. 

* report_header.html :- This HTML file contains the html header for test reports.

* test_input_combinations.txt :- This text file contains the input parameter combinations for constructing the brazil CLI during runtime. The parameters must be added based on the order of test cases to be executed.
