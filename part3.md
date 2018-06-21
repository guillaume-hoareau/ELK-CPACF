# Part III. Building a crypto dashboard with Kibana

In this part, you will create your first crypto dashboard with Kibana. 

Kibana is a window into the Elastic Stack. It enables visual exploration and real-time analysis of your data in Elasticsearch. This video is perfect for users that are new to Kibana and are looking for a primer on data exploration, visualization, and dashboarding. Watch Alex Francoeur give a demo of going from a Kibana installation to a full dashboard in matter of minutes. 

## Creating your first index

### 1. Connect to the URL of your kibana instance.
Note that your IP adress is different, you must adapt the following accordingly.
http://18.197.196.0:5601

The kibana web interface should look like as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99e%CC%81cran%202018-06-20%20a%CC%80%2016.58.10%20(2).png)
  
### 2. Click on the left tab bar to "Management"


#### 3. Main Management / Kibana Panel
Click on Index pattern area, and fill the tab with monitor* as follow. 
Then click to Next Step.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.44.34%20(2).png)

#### Configure four first index pattern
In configure settings panel, please select @Timestamp.
Then validate by clicking on Create index pattern.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.34%20(2).png)

#### A new index pattern is born 
The structure of the index monitor* is displayed front of you:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.45%20(2).png)

## Creating your first search

You can interactively explore your data from the Discover page. You have access to every document in every index that matches the selected index pattern. You can submit search queries, filter the search results, and view document data. You can also see the number of documents that match the search query and get field value statistics. If a time field is configured for the selected index pattern, the distribution of documents over time is displayed in a histogram at the top of the page.

#### 1. Click on the left tab bar to "Discover". 
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99e%CC%81cran%202018-06-20%20a%CC%80%2017.07.05%20(2).png)

#### 2. Let's start to discover and to explore crypto data sent by LinuxONE virtual machine.
When you submit a search request, the histogram, Documents table, and Fields list are updated to reflect the search results. The total number of hits (matching documents) is shown in the toolbar. The Documents table shows the first five hundred hits. 

By default, the hits are listed in reverse chronological order, with the newest documents shown first. You can reverse the sort order by clicking the Time column header. You can also sort the table by the values in any indexed field.

Click on Available field MODE as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.46.45%20(2).png)

#### 3. Click on "add" field MODE as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.22%20(2).png)

#### 4. Now on the top right bar, click on Save as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.27%20(2).png)

#### 5. Save your first search as "icastats". 
This will be used as dashboard basements to build visualization later.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

## Creating your first visualization
A Kibana dashboard displays a collection of visualizations and searches. You can arrange, resize, and edit the dashboard content and then save the dashboard so you can share it.

#### 1. Click on Visualize in the side navigation.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

#### 2. Click the Create new visualization button or the + button.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

#### 3. Choose the visualization type: Vertical Bar
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.48.41%20(2).png)

#### 4. Specify a search query to retrieve the data for your visualization.
To build a visualization from a saved search, click the name of the saved search you previously saved (icastats). This opens the visualization builder and loads the selected query. When you build a visualization from a saved search, any subsequent modifications to the saved search are automatically reflected in the visualization. To disable automatic updates, you can disconnect a visualization from the saved search.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.48.53%20(2).png)

#### 5. Vizualization builder
In the visualization builder, choose the metric aggregation for the visualization’s Y axis: Average
In the visualization builder, choose the metric field for the visualization’s Y axis: AES CBC
For the visualizations X axis, select a bucket aggregation: Date Histogram
For the visualizations X axis, select a bucket field: @Timestamp
For the visualizations X axis, select a bucket interval: Auto

Now click on play button as follow:
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.49.17%20(2).png)

You should be able to visualize incoming crypto metrics with a bar chart.

#### 6. Now on the top right bar, click on Save.

#### 7. Save as "AES" your first vizualization chart.
![alt text](https://github.com/guikarai/ELK-CPACF/blob/master/images/Capture%20d%E2%80%99%C3%A9cran%202018-05-24%20%C3%A0%2011.47.40%20(2).png)

Repeat the creation of visualization with DES, TDES, SHA-1 and DRBG-SHA-512. Your visualization collection should look like the following:
Capture d’écran 2018-05-24 à 11.51.53 (2)

## Creating your first dashboard

Capture d’écran 2018-05-24 à 11.52.10 (2)

Capture d’écran 2018-05-24 à 11.52.15 (2)

Capture d’écran 2018-05-24 à 11.52.32 (2)

Capture d’écran 2018-05-24 à 11.52.55 (2)
