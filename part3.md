# Part III. Building a crypto dashboard
## Creating your first index

### 1. Connect to the URL of your kibana instance.
Note that your IP address is different, and adapt accordingly.
http://18.197.196.0:5601

The kibana web interface should look like as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99e%CC%81cran%202018-06-20%20a%CC%80%2016.58.10%20(2).png)
  
### 2. Click on the left tab bar to "Management"


### 3. Click on Index pattern area, and fill the tab with monitor* as follow. Then click to Next Step.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.44.34%20(2).png)

### 4. Configure Setting Panel
In configure settings panel, please select @Timestamp and validate by clicking on Create index pattern.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.34%20(2).png)

### 5. You can check that everything is OK. 
The structure of the index monitor* is displayed front of you:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.45%20(2).png)

## Creating your first search

### 1. Click on the left tab bar to "Discover". 
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99e%CC%81cran%202018-06-20%20a%CC%80%2017.07.05%20(2).png)

### 2. Let's start to discover and to explor data sent by LinuxONE virtual machine. 
Click on Available field MODE as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.45%20(2).png)
Capture d’écran 2018-05-24 à 11.47.40 (2)

### 3. Click on "add" field MODE as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.45%20(2).png)
Capture d’écran 2018-05-24 à 11.47.49 (2)

### 4. Now on the top right bar, click on Save as follow:

### 5. Save as icastats your first elasticsearch result. This will be used as dashboard basements to build visualization later.


## Creating your first visualization

Capture d’écran 2018-05-24 à 11.48.37 (2)

Capture d’écran 2018-05-24 à 11.48.41 (2)

Capture d’écran 2018-05-24 à 11.48.53 (2)

Capture d’écran 2018-05-24 à 11.49.17 (2)

Capture d’écran 2018-05-24 à 11.49.29 (2)

Repeat the creation of visualization with DES, TDES, SHA-1 and DRBG-SHA-512. Your visualization collection should look like the following:
Capture d’écran 2018-05-24 à 11.51.53 (2)



#### Creating your first dashboard

Capture d’écran 2018-05-24 à 11.52.10 (2)

Capture d’écran 2018-05-24 à 11.52.15 (2)

Capture d’écran 2018-05-24 à 11.52.32 (2)

Capture d’écran 2018-05-24 à 11.52.55 (2)
