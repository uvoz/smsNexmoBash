#!/bin/bash
#Nexmo SMS script 
#2015 by Heida@Uvoz5


#take first parameter = TO
to=$1
shift

#all other "parameters" given after the first, we concider text/
#curl->Nexmo likes + signs between the words.  So here we go:

msg=""
first=1

while test ${#} -gt 0
do
if [ $first -eq 1 ]; then
  msg=$msg$1
  shift
  first=0
else
  msg="$msg+$1"
  shift
fi

done



#now curl the message  to NEXMO
curl -G 'https://rest.nexmo.com/sms/json' \
-d api_key=YOUR API KEY HERE \
-d api_secret=YOUR API SECRET HERE \
-d to=$to \
-d from=YOUR PHONE NUMBER HERE \
-d text=$msg

#--data-urlencode $msg 
