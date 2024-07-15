# MarketingAnalytics
Conversions and Marketing Dashboard: This project involves querying and building a bi-annual revenue report for a marketing company and their streamlines of impressions.

### Update 7.14.24
- I have updated the piechart to a barchart. I learned in a book to avoid pie charts because it is hard to read differences, so I went ahead and changed it to a understandable bar chart.
- I also have updated the colors to the overall report, changing the "cost" to an orange, signifying loss.
- I added a slicer for valuable, individual channel insights.

  _If you have any comments or concerncs, please feel free to reach out!_

![image](https://github.com/user-attachments/assets/8ffd24b1-2c4f-4d32-98b6-b49b95c9c93c)

 <br />
_ Screenshot of the updated report. _

## Identify Business Questions
In this project, I aimed on showcasing and briefing a marketing companies conversion rates and profits for a 6 month time period.
Some questions I aimed on answering was:

-- 1. Which channel provides the best return on investment (ROI)? <br />
-- 2. Which marketing channel has the highest average conversion rate? <br />
-- 3. How does the cost per conversion vary across different channels? <br />
-- 4. Which channel has the lowest cost per click (CPC)? <br /> 
-- 5. How does the conversion rate change with increasing campaign costs? <br />
-- 6. Are there any trends in conversion rates over time for specific channels? <br />
-- 7. What is the overall trend in revenue generation over the six months? <br />

## Collect and Store Data
To collect and store data, I developed a fictional dataset about a marketing company from ChatGPT. I then stored this dataset in a csv document, connecting it to a SQL Server Database.

## Clean and prepare data
I then cleaned the data in SQL Server. I extracted month data to get revenue by month, as well as wrangling the data in SQL to get conversion rates and profit.

## Analyze data
To analyze the data, I queried the data to find any progressions in revenue across the channels. Also, I wanted to find conversion rates and what channel had the lowest cost per click. 

## Visualize and communicate data
I then visualized the data in PowerBI. I made multiple visualizations showing the profit, revenue, and conversions rates, along with major KPI's like total revenue, impressions and clicks.

## Conclusion
From the analytics and visualizations, I could now answer the key business questions. 

-- 1. Email is seen with the best ROI, followed by Search Engine, Display Ads, and finally Social Media. Investment gains favorably compared to cost for email. <br />
-- 2. The marketing channel with the highest average conversion rate is Email. <br />
-- 3. Email had the lowest cost per conversion rate across the channels. <br />
-- 4. The lowest cost per click by channel is Display Ads. <br />
-- 5. The conversions rates tend to the best when the cost for deployment was around $500-999. When the cost was greater the conversion rates were lower, but that may be skewed due to the little volume of deployment attempts at >$1000. <br />
-- 6. Conversion rates were better over time for display ads, worse for social media, and stayed the same for email and search engine. <br />
-- Email and search engine did get better around month 5 and 4, respectfully, but returned to its original conversion rate after the 6th month. <br />
-- 7. Profit has remained relatively the same, but in particular month 5 was a really good month. $225,000 in profit. <br />


