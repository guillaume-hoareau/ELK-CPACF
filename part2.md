## Part 2 - Starting an ELK on LinuxONE for Monitoring Cryptographic Activities
"ELK" is the acronym for three open source projects: Elasticsearch, Logstash, and Kibana. Elasticsearch is a search and analytics engine. Logstash is a server‑side data processing pipeline that ingests data from multiple sources simultaneously, transforms it, and then sends it to a "stash" like Elasticsearch. Kibana lets users visualize data with charts and graphs in Elasticsearch. The Elastic Stack is the next evolution of ELK.

This part to monitor crypto APIs of a LinuxONE instance thanks to ELK.

### Seting-up an ELK infrastructure 
An ELK stack can be implemented very easily, not matter the processor architecture.

If you want to monitor a LinuxONE Crypto activities with an ELK running on x86, please follow the following instructions:
- Deploying a docker ELK on Linux: https://github.com/deviantony/docker-elk

If you want to monitor a LinuxONE Crypto activities with an ELK running also on LinuxONE, please follow the following instructions:
- Building Elasticsearch on LinuxONE : https://github.com/linux-on-ibm-z/docs/wiki/Building-Elasticsearch
- Buidling Logstash on LinuxONE : https://github.com/linux-on-ibm-z/docs/wiki/Building-Logstash
- Building Kibana on LinuxONE : https://github.com/linux-on-ibm-z/docs/wiki/Building-Kibana

(Recommanded) If you want to monitor a LinuxONE Crypto activities after deploying a docker ELK on Linux:LinuxONE, please follow the following instructions:

Required tool:
```
root@crypt06:~# sudo apt-get install git docker docker-compose
```

Required dockerfile:
```
root@crypt06:~# git clone https://github.com/guikarai/ELK-CPACF.git
```

Building a kibana docker image for s390 architecture:
```
root@crypt06:~# cd dockerfile-examples/
root@crypt06:~# cd Kibana
root@crypt06:~# sudo docker build -t "kibana:Dockerfile" .
```

Building an elasticsearch docker image for s390 architecture:
```
root@crypt06:~# cd dockerfile-examples/
root@crypt06:~# cd Elasticsearch
root@crypt06:~# sudo docker build -t "elasticsearch:Dockerfile" .
```

Starting up ELK:
```
cd..
sudo docker-compose up -d
```

Please verify that the ELK Stack is properly started issuing the following command:
```
root@crypt06:~# sudo docker ps -a
CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS              PORTS                                            NAMES
fc2242672599        dockerelk_kibana          "/bin/bash /usr/lo..."   22 hours ago        Up 22 hours         0.0.0.0:5601->5601/tcp                           dockerelk_kibana_1
8f87424acd61        dockerelk_elasticsearch   "/usr/local/bin/do..."   22 hours ago        Up 22 hours         0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp   dockerelk_elasticsearch_1
```

### Seting-up crypto data collection
Please, correct the default ESserverIP adress with your @IP adress according to your environment.
Let's start with the script in charge to collect data from the icastats command:
```
root@crypt06:~# vi icastats.sh
#!/bin/bash
ESserverIP="18.197.196.0" <--- Change with your IP address here
```

So see with a user friendly interface the status of your elasticsearch instance, please, install in your computer the elasticsearch web-plugin named elasticsearch-head. FIll in the form and connect to your elasticsearch instance with the appropriate IP adress. The portname is by default 9200.


It is now time to feed your elastic search with collected data and to create an index on elasticsearch database. Please issue the following command:
```
root@crypt06:~# sudo chmod +x icastats.sh
root@crypt06:~# ./icastats.sh
{"_index":"monitor-icastats","_type":"icastats","_id":"RD8FkmMBF84PFKnZKoVW","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":0,"_primary_term":1}
{"_index":"monitor-icastats","_type":"icastats","_id":"RD8FkmMBF84PFKnZKoVW","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":0,"_primary_term":1}
...
```

Ervery 5 seconds, a record will be sent to the elasticsearch db. To assess that with web interface, there are new records added in the elasticsearch db.

You are now good for the part 3.

