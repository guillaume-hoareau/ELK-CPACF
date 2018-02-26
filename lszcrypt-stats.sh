#!/bin/bash

ESindex=monitor-lszcrypt
EStype=lszcrypt
EStypeLast=lszcryptLast
EShost="$(hostname)"

#SAMPLE OF OUTPUT TO BE PARSED
#CARD.DOMAIN TYPE  MODE        STATUS  REQUEST_CNT PENDINGQ_CNT REQUESTQ_CNT HW_TYPE Q_DEPTH FUNCTIONS 
#------------------------------------------------------------------------------------------------------
#01          CEX5A Accelerator online       116252            0            0      11      08 0x68800000

function sendToES {
        now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
        curl -XPOST "http://10.3.57.112:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
	{
		"Host":"'${EShost}'",
		"@Timestamp":"'${now}'",
		"Timesec":'$1',
		"CARD.DOMAINS":"'$2'",
		"TYPE":"'$3'",
		"MODE":"'$4'",
		"STATUS":"'$5'",
		"REQUEST_CNT":'$6',
		"PENDINGQ_CNT":'$7',
		"REQUESTQ_CNT":'$8',
		"HW_TYPE":'${9}',
		"Q_DEPTH":"'${10}'",
		"FUNCTIONS":"'${11}'"
	}'
}

function cleanType {
                curl -XDELETE "http://10.3.57.112:9200/${ESindex}/$1${EShost}/_query" -d '
{
  "query": {
    "bool": {
      "must": [
        {
          "match_all": {}
        }
      ]
    }
  }
}
'
}

while true
do

EStimesec="$(date +%s)"
cleanType "${EStype}"

INFOS="$(lszcrypt -V 2>/dev/null)"

VALUE1="$(echo ${INFOS} | gawk '{print $12}')" #CARD.DOMAIN
VALUE2="$(echo ${INFOS} | gawk '{print $13}')" #TYPE
VALUE3="$(echo ${INFOS} | gawk '{print $14}')" #MODE
VALUE4="$(echo ${INFOS} | gawk '{print $15}')" #STATUS
VALUE5="$(echo ${INFOS} | gawk '{print $16}')" #REQUEST_CNT
VALUE6="$(echo ${INFOS} | gawk '{print $17}')" #PENDINGQ_CNT
VALUE7="$(echo ${INFOS} | gawk '{print $18}')" #REQUESTQ_CNT
VALUE8="$(echo ${INFOS} | gawk '{print $19}')" #HW_TYPE
VALUE9="$(echo ${INFOS} | gawk '{print $20}')" #Q_DEPTH
VALUE10="$(echo ${INFOS} | gawk '{print $21}')" #FUNCTIONS

#SAMPLE OF OUTPUT TO BE PARSED
#CARD.DOMAIN TYPE  MODE        STATUS  REQUEST_CNT PENDINGQ_CNT REQUESTQ_CNT HW_TYPE Q_DEPTH FUNCTIONS 
#------------------------------------------------------------------------------------------------------
#01          CEX5A Accelerator online       116252            0            0      11      08 0x68800000

#echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}"

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}"

sleep 5

done
