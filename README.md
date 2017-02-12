## SMS trough Nexmo from linux command prompt


### Installation
* ensure that you have curl installed 
* copy the script and make it executable 
* Edit the script and enter the Nexmo API-Key, the API Secret and keys and the sender phone-number

### usage
smsNexmo.sh phonenumer-receiver your message

Example: 
smsNexmo.sh 420123456789 Hello! This message is sent trough Nexmo


###Note
Currently no feedback from Nexmo is being parsed/processed. No explicit error is raised when the message is not sent for what ever reason.

