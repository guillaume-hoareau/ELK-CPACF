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

### 2. Let's start to discover and to explore crypto data sent by LinuxONE virtual machine. 
Click on Available field MODE as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.45%20(2).png)
Capture d’écran 2018-05-24 à 11.47.40 (2)

### 3. Click on "add" field MODE as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.22%20(2).png)

### 4. Now on the top right bar, click on Save as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.27%20(2).png)

### 5. Save as "icastats" your first elasticsearch result. This will be used as dashboard basements to build visualization later.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

## Creating your first visualization
### 1. Click on Visualize in the side navigation.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

### 2. Click the Create new visualization button or the + button.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

### 3. Choose the visualization type: Vertical Bar
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.48.41%20(2).png)

### 4. Specify a search query to retrieve the data for your visualization.
To build a visualization from a saved search, click the name of the saved search you previously saved (icastats). This opens the visualization builder and loads the selected query. When you build a visualization from a saved search, any subsequent modifications to the saved search are automatically reflected in the visualization. To disable automatic updates, you can disconnect a visualization from the saved search.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.48.53%20(2).png)

### 5. Vizualization builder
In the visualization builder, choose the metric aggregation for the visualization’s Y axis: Average
In the visualization builder, choose the metric field for the visualization’s Y axis: AES CBC
For the visualizations X axis, select a bucket aggregation: Date Histogram
For the visualizations X axis, select a bucket field: @Timestamp
For the visualizations X axis, select a bucket interval: Auto

Now click on play button as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.49.17%20(2).png)

You should be able to visualize incoming crypto metrics with a bar chart.

### 6. Now on the top right bar, click on Save.

### 7. Save as "AES" your first vizualization chart.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

Repeat the creation of visualization with DES, TDES, SHA-1 and DRBG-SHA-512. Your visualization collection should look like the following:
Capture d’écran 2018-05-24 à 11.51.53 (2)



#### Creating your first dashboard

Capture d’écran 2018-05-24 à 11.52.10 (2)

Capture d’écran 2018-05-24 à 11.52.15 (2)

Capture d’écran 2018-05-24 à 11.52.32 (2)

Capture d’écran 2018-05-24 à 11.52.55 (2)
