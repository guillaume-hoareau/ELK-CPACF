# Hands-on LAB : ELK on LinuxONE for Monitoring Cryptographic Activities
"ELK" is the acronym for three open source projects: Elasticsearch, Logstash, and Kibana. Elasticsearch is a search and analytics engine. Logstash is a server‑side data processing pipeline that ingests data from multiple sources simultaneously, transforms it, and then sends it to a "stash" like Elasticsearch. Kibana lets users visualize data with charts and graphs in Elasticsearch.

The Elastic Stack is the next evolution of ELK.

## ELK Setup
An ELK stack can be implemented very easily, not matter the processor architecture.

If you want to monitor a LinuxONE Crypto activities with an ELK running on x86, please follow the following instructions:
- Deploying a docker ELK on Linux: https://github.com/deviantony/docker-elk

If you want to monitor a LinuxONE Crypto activities with an ELK running also on LinuxONE, please follow the following instructions:
- Building Elasticsearch on LinuxONE : https://github.com/linux-on-ibm-z/docs/wiki/Building-Elasticsearch
- Buidling Logstash on LinuxONE : https://github.com/linux-on-ibm-z/docs/wiki/Building-Logstash
- Building Kibana on LinuxONE : https://github.com/linux-on-ibm-z/docs/wiki/Building-Kibana

## LinuxONE Hardware Cryptographic APIs Enablement
The Library for IBM® Cryptographic Architecture (libica) is a library of cryptographic functions that are used to write cryptographic applications on Linux on Z and LinuxONE, both with and without cryptographic hardware.
This information is intended for C programmers who want to access Linux on Z and LinuxONE hardware support for cryptographic methods. In particular, it addresses programmers who write hardware-specific plug-ins for cryptographic libraries such as openssl and openCryptoki.

The libica packages include tools to investigate the capabilities of your cryptographic hardware and how these capabilities are used by applications that use libica.

icainfo - Show available libica functions
Use the icainfo command to find out which libica functions are available on your Linux system.

icastats - Show use of libica functions
Use the icastats utility to find out whether libica uses hardware acceleration features or works with software fallbacks. icastats collects the statistical data per user and not per system.

First of all do check if libica is installed in your LinuxONE system. Issue the following command according to your linux distribution.

RHEL - yum install libica libica-tools
SUSE - yast install libica libica-tools
UBUNTU - apt-get install libica libica-tools

Then, please issue the following command in order to assess that your system is ready to be
```
icainfo
```

```
icastats
```

```
lszcrypt -VVVV
```


## LinuONE Agents to feed ELK
ELK is about storing, and displaying as easy as possible data. To feed ELK with data we needs to use some agent in order to collect data from LinuxONE Crypto APIs first.
```
git clone https://github.com/guikarai/ELK-CPACF.git
```

```
cd
```


## KIBANA Monitoring

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/guikarai/ELK-CPACF/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
