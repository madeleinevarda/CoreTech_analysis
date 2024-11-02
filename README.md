# CoreTech - E-commerce Analysis

CoreTech is a global e-commerce company that has sold more than 28M dollars of popular electronics since its inception in 2019. With vast amounts of previously underutilized data on sales, product offerings, the loyalty program, and refunds, we are now thoroughly analyzing this information to uncover critical insights. This analysis aims to enhance CoreTechs's commercial performance and has been prepared for presentation to key stakeholders to drive informed company recommendations.

The Entity Relationship Diagram can be found [here](https://github.com/madeleinevarda/elist_analysis/blob/main/ERD.png).

The data cleaning change log can be found [here](https://github.com/madeleinevarda/elist_analysis/blob/main/Data%20Cleaning%20Change%20Log.png).

 The SQL queries performed to uncover these insights are found here.

# Deep-Dive Insights

## Sales Trends 

**Overview:**

From 2019-2022, over 108K orders generated $28M in sales, with both metrics showing a 28% growth increase over this four-year period. Particularly noteworthy, sales surged dramatically by over 6M in 2020 during the onset of the pandemic, as consumer purchasing patterns pivoted sharply toward online ordering. However, this momentum did not sustain through 2021 and 2022, as trends in sales (-46%), average order value (AOV) (-10%), and order count (-40%) showed substantial declines. Finding ways to maintain the value captured during 2020 and 2021 is key to continue towards sustained long term growth.

<p align='center'>
<img width="425" alt="Screenshot 2024-10-26 210157" src="https://github.com/user-attachments/assets/8fc74992-c6ba-4785-bdca-4c228b96370a">
</p>

**Seasonality and Geographic Trends:**

Typically, February and October underperform compared to the preceding months, while December and January boast high average sales due to the holiday season. Notably, in 2020, March sales surged 50% over February, an anomaly not reflecting the usual trend from 2019-2022, where March generally sees a modest increase over February.

When broken down by regions, Latin America shows a distinct pattern from global trends. While most regions see a 20-25% increase from November to December during the holiday season, Latin America experiences more modest spikes (10%). Instead, their peak sales occur in April (+20%) and in July (+24%).

<p align='center'>
<img width="450" alt="Screenshot 2024-10-26 205923" src="https://github.com/user-attachments/assets/1e9662c4-2f65-4953-8ab9-218034c5fd31">
</p>

## Product Trends

Gaming monitors and laptops are the core of CoreTech's revenue stream. While these categories historically accounted for a maximum of 75% of total sales, 2021 stands out with an unprecedented concentration, reaching nearly 95% of all transactions. Interestingly, headphone sales, which previously represented 26% of revenue, were almost completely absent in 2021, potentially indicating either a data recording oversight or supply chain disruptions affecting product availability.   

<p align='center'>
<img width="550" alt="Screenshot 2024-10-27 172948" src="https://github.com/user-attachments/assets/e10d75ca-2008-4fb5-ada2-6a8ffa085515">
</p>

## Loyalty Program
In an aggregate of the past four years, the non-loyalty program generally outperformed the loyalty program, generating almost double (17M). However, a closer look at the trends reveals that the loyalty program surpassed the non-loyalty program in total sales in 2021 and in Average Order Value (AOV) in 2022. Evidence suggests that the loyalty program's AOV has been steadily growing, as opposed to the volatile non-loyalty program. 

<p align='center'>
<img width="450" alt="Screenshot 2024-11-02 133145" src="https://github.com/user-attachments/assets/c2ee4732-94bc-48cc-9546-c3881698278b">
</p>

<p align='center'>
<img width="1000" alt="Screenshot 2024-11-02 132900" src="https://github.com/user-attachments/assets/b03b06d2-2945-4aaa-a8cb-17d565b21769">
</p>

## Refund Rates
Gaming monitors and laptops have consistently made up most of our refunds (X%). Looking at broader refund trends, 2021, overall refund rates decreased (X%), an unusual trend since sales and refunds usually increase in tandem. Higher sales but fewer returns in 2021 might be due to missing refund data, indicating either tracking issues or a potential no-refund policy. If this policy began in 2021, it would significantly influence purchasing decisions and customer satisfaction as well as explaining the lack of refund data for 2022.

<p align='center'>
<img width="1000" alt="Screenshot 2024-11-02 171726" src="https://github.com/user-attachments/assets/205c288a-a58a-4f23-b248-2710899f01a1">
</p>

# Recommendations

## Sales 
* Re-engage past customers, with a heavy focus on the customer base from 2020 to 2021 by launching targeted campaigns to re-engage them.
*  Address underperforming months like February and October with special promotions, product launches, or events to boost sales.

## Product 
* Implement cross-selling strategies to encourage customers to purchase accessories like headphones with their gaming monitors and laptops.
* Conduct regular audits to ensure accurate data recording and tracking mechanisms to prevent overshight and missing sales data. 

## Loyalty Program
* Given the steady growth in AOV for the loyalty program, consider enhancing its benefits to attract more customers by offering exclusive discounts, early access to sales, and special rewards to increase its appeal.
* Segment loyalty program members based on their purchasing behavior. Develop targeted marketing campaigns for each segment to maximize potential.

## Refund Rates
* Implement product quality checks or enhanced customer support for most frequently refunded products. Understanding why gaming monitors and laptops dominate refunds could offer actionable insights to reduce return rates and improve customer satisfaction.
*  Investigate 2021 trends to further analyze why refunds decreased despite increased sales. Identify specific changes that impacted this period, which could help maintain a low refund rate.
*  Confirm whether a no-refund policy was implemented or if no data was collected in 2022.
