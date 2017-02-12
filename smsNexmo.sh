#!/bin/bash
#Nexmo SMS script to submit SMS messages trough Nexmo from Linux
#Note: no checking of balances or success is now provided in this script.

#MIT License

#Copyright (c) 2015 Bob Heida @ Uvoz

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.


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
