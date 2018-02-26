#!/bin/bash

ESindex=monitor-hashicastats
EStype=hashicastats
EStypeLast=hashicastatsLast
EShost="$(hostname)"

# SHA-1		 |         7900196          |                1
# SHA-224	 |               0          |                0
# SHA-256	 |         4999163          |                0
# SHA-384	 |               0          |                0
# SHA-512	 |               0          |                0
# SHA3-224	 |               0          |                0
# SHA3-256	 |               0          |                0
# SHA3-384	 |               0          |                0
# SHA3-512	 |               0          |                0
# SHAKE-128	 |               0          |                0
# SHAKE-256	 |               0          |                0
# GHASH		 |           62816          |                0
# P_RNG		 |               0          |                0
# DRBG-SHA-512	 |           11154          |                0

function sendToES {
       now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
       curl -XPOST "http://10.3.57.112:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
	{
		"Host":"'${EShost}'",
		"@Timestamp":"'${now}'",
		"Timesec":'$1',
		"MODE":"'$2'",
		"SHA-1":'$3',
		"SHA-224":'$4',
		"SHA-256":'$5',
		"SHA-384":'$6',
		"SHA-512":'$7',
                "SHA3-224":'$8',
  		"SHA3-256":'${9}',
		"SHA3-384":'${10}',
		"SHA3-512":'${11}',
                "SHAKE-128":'${12}',
                "SHAKE-256":'${13}',
                "GHASH":'${14}',
                "P_RNG":'${15}',
                "DRBG-SHA-512":'${16}'
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

INFOS="$(sudo icastats)"

     #HARDWARE
      VALUE1="$(echo ${INFOS} | gawk '{print $18}')" #SHA1 HARD CRYPT
      VALUE2="$(echo ${INFOS} | gawk '{print $23}')" #SHA224 HARD CRYPT
      VALUE3="$(echo ${INFOS} | gawk '{print $28}')" #SHA256 HARD CRYPT
      VALUE4="$(echo ${INFOS} | gawk '{print $33}')" #SHA384 HARD CRYPT
      VALUE5="$(echo ${INFOS} | gawk '{print $38}')" #SHA512 HARD CRYPT
      VALUE6="$(echo ${INFOS} | gawk '{print $43}')" #SHA3-224 HARD CYPT
      VALUE7="$(echo ${INFOS} | gawk '{print $48}')" #SHA3-256 HARD CRYPT
      VALUE8="$(echo ${INFOS} | gawk '{print $53}')" #SHA3-384 HARD CRYPT
      VALUE9="$(echo ${INFOS} | gawk '{print $58}')" #SHA3-512 HARD CRYPT
      VALUE10="$(echo ${INFOS} | gawk '{print $63}')" #SHAKE-128 HARD CRYPT
      VALUE11="$(echo ${INFOS} | gawk '{print $68}')" #SHAKE-256 HARD CRYPT
      VALUE12="$(echo ${INFOS} | gawk '{print $73}')" #GHASH HARD CRYPT
      VALUE13="$(echo ${INFOS} | gawk '{print $78}')" #P_RNG HARD CRYPT
      VALUE14="$(echo ${INFOS} | gawk '{print $83}')" #DRBG-SHA-512 HARD CRYPT

      #SOFTWARE
      VALUE15="$(echo ${INFOS} | gawk '{print $20}')" #SHA1 SOFT CRYPT
      VALUE16="$(echo ${INFOS} | gawk '{print $25}')" #SHA224 SOFT CRYPT
      VALUE17="$(echo ${INFOS} | gawk '{print $30}')" #SHA256 SOFT CRYPT
      VALUE18="$(echo ${INFOS} | gawk '{print $35}')" #SHA384 SOFT CRYPT
      VALUE19="$(echo ${INFOS} | gawk '{print $40}')" #SHA512 SOFT CRYPT
      VALUE20="$(echo ${INFOS} | gawk '{print $45}')" #SHA3-224 SOFT CYPT
      VALUE21="$(echo ${INFOS} | gawk '{print $50}')" #SHA3-256 SOFT CRYPT
      VALUE22="$(echo ${INFOS} | gawk '{print $55}')" #SHA3-384 SOFT CRYPT
      VALUE23="$(echo ${INFOS} | gawk '{print $60}')" #SHA3-512 SOFT CRYPT
      VALUE24="$(echo ${INFOS} | gawk '{print $65}')" #SHAKE-128 SOFT CRYPT
      VALUE25="$(echo ${INFOS} | gawk '{print $70}')" #SHAKE-256 SOFT CRYPT
      VALUE26="$(echo ${INFOS} | gawk '{print $75}')" #GHASH SOFT CRYPT
      VALUE27="$(echo ${INFOS} | gawk '{print $80}')" #P_RNG SOFT CRYPT
      VALUE28="$(echo ${INFOS} | gawk '{print $85}')" #DRBG-SHA-512 SOFT CRYPT


sendToES "${EStimesec}" "HARDWARE" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}" "${VALUE11}" "${VALUE12}" "${VALUE13}" "${VALUE14}"

sendToES "${EStimesec}" "SOFTWARE" "${VALUE15}" "${VALUE16}" "${VALUE17}" "${VALUE18}" "${VALUE19}" "${VALUE20}" "${VALUE21}" "${VALUE22}" "${VALUE23}" "${VALUE24}" "${VALUE25}" "${VALUE26}" "${VALUE27}" "${VALUE28}"

sleep 5

done
