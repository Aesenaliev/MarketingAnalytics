-- Questions needed for analysis
USE marketing
-- 1. Which channel provides the best return on investment (ROI)?

SELECT Channel, SUM(Revenue) as total_revenue, SUM(Cost) AS total_cost, (SUM(Revenue)-SUM(Cost))/SUM(Cost) * 100 AS ROI
FROM marketing_campaigns
GROUP BY Channel
ORDER BY ROI DESC

-- Email is seen with the best ROI, followed by Search Engine, Display Ads, and finally Social Media. Investment gains favorably compared to cost for email.


-- 2. Which marketing channel has the highest average conversion rate?

SELECT Channel, CAST(ROUND((SUM(Conversions) * 1.0 /SUM(Clicks)) * 100,2) AS DECIMAL(10,2)) AS conversion_rate 
FROM marketing_campaigns
GROUP BY Channel
ORDER BY conversion_rate DESC

-- The marketing channel with the highest average conversion rate is Email.

-- 3. How does the cost per conversion vary across different channels?

SELECT Channel, SUM(Cost) as total_cost, SUM(Conversions) AS total_conversions, SUM(Cost)/SUM(Conversions) AS cost_per_conversion 
FROM marketing_campaigns
GROUP BY Channel
ORDER BY cost_per_conversion ASC

-- Email had the lowest cost per conversion rate across the channels.

-- 4. Which channel has the lowest cost per click (CPC)?

SELECT Channel, SUM(Cost)/SUM(Clicks) as CPC
FROM marketing_campaigns
GROUP BY Channel
ORDER BY CPC ASC

-- The lowest cost per click by channel is Display Ads.

-- 5. How does the conversion rate change with increasing campaign costs?

WITH CostBins AS (
    SELECT 
        CASE 
            WHEN Cost < 100 THEN '0-99'
            WHEN Cost BETWEEN 100 AND 499 THEN '100-499'
            WHEN Cost BETWEEN 500 AND 999 THEN '500-999'
            ELSE '1000+' 
        END AS cost_range,
        SUM(Conversions) AS total_conversions,
        SUM(Clicks) AS total_clicks
    FROM 
        marketing_campaigns
    GROUP BY 
        CASE 
            WHEN Cost < 100 THEN '0-99'
            WHEN Cost BETWEEN 100 AND 499 THEN '100-499'
            WHEN Cost BETWEEN 500 AND 999 THEN '500-999'
            ELSE '1000+' 
        END
)
SELECT 
    cost_range,
    (SUM(total_conversions) * 100.0) / SUM(total_clicks) AS conversion_rate
FROM 
    CostBins
GROUP BY 
    cost_range
ORDER BY 
    cost_range



-- 6. Are there any trends in conversion rates over time for specific channels?
sp_rename 'marketing_campaigns.Date', 'market_month' , 'COLUMN';

SELECT Channel, DATEPART(month, market_date) AS market_month, (SUM(Conversions) * 100.0) / SUM(Clicks) AS conversion_rate
FROM marketing_campaigns
GROUP BY Channel, DATEPART(month, market_date)
ORDER BY Channel, market_month

-- Conversion rates were better over time for display ads, worse for social media, and stayed the same for email and search engine.
-- Email and search engine did get better around month 5 and 4, respectfully, but returned to its original conversion rate after the 6th month.

-- 7. What is the overall trend in revenue generation over the six months?

SELECT DATEPART(month, market_date) as market_month, SUM(Revenue)as revenue, SUM(Cost) as cost, SUM(Revenue)-SUM(Cost) AS profit
FROM marketing_campaigns
GROUP BY DATEPART(month, market_date)
ORDER BY market_month

-- Profit has remained relatively the same, but in particular month 5 was a really good month. $225,000 in profit.

SELECT * FROM marketing_campaigns