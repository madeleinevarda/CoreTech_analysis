# elist_analysis
elist is a global e-commerce company that has sold more than X dollars of popular electronics since its inception in 2019. With vast amounts of previously underutilized data on sales, product offerings, the loyalty program, and refunds, we are now thoroughly analyzing this information to uncover critical insights. This analysis aims to enhance elist's commercial performance and has been prepared for presentation to key stakeholders to drive informed company recommendations.

The Entity Relationship Diagram can be found [here](https://github.com/madeleinevarda/elist_analysis/blob/main/ERD.png).

The data cleaning change log can be found [here](https://github.com/madeleinevarda/elist_analysis/blob/main/Data%20Cleaning%20Change%20Log.png).

 The SQL queries performed to uncover these insights are found here.

# Deep-Dive Insights

## Sales Trends 

**Overview:**

From 2019-2022, over 108K orders generated $28M in sales, with both metrics showing a 28% growth increase over this four-year period. Particularly noteworthy, sales surged dramatically by X% in 2020 during the onset of the pandemic, as consumer purchasing patterns pivoted sharply toward online ordering. However, this momentum did not sustain through 2021 and 2022, as trends in sales, average order value (AOV), and order count showed substantial declines by X%. Finding ways to maintain the value captured during 2020 and 2021 is key to continue towards sustained long term growth.

<p align='center'>
<img width="425" alt="Screenshot 2024-10-26 210157" src="https://github.com/user-attachments/assets/8fc74992-c6ba-4785-bdca-4c228b96370a">
</p>

**Seasonality:**

Typically, February and October underperform compared to the preceding months, while December and January boast high average sales due to the holiday season. Notably, in 2020, March sales surged 50% over February, an anomaly not reflecting the usual trend from 2019-2022, where March generally sees a modest increase over February.

<p align='center'>
<img width="450" alt="Screenshot 2024-10-26 205923" src="https://github.com/user-attachments/assets/1e9662c4-2f65-4953-8ab9-218034c5fd31">
</p>

## Product Trends

Gaming monitors and laptops are the core of elist's revenue stream. While these categories historically account for approximately X% of total sales, 2021 stands out with an unprecedented concentration, reaching nearly X% of all transactions. Interestingly, headphone sales, which traditionally represent X% of revenue, were completely absent in 2021, potentially indicating either a data recording oversight or supply chain disruptions affecting product availability.   

<p align='center'>
<img width="550" alt="Screenshot 2024-10-27 172948" src="https://github.com/user-attachments/assets/e10d75ca-2008-4fb5-ada2-6a8ffa085515">
</p>

## Loyalty Program
In an aggregate of the past four years, the non-loyalty program generally outperformed the loyalty program. However, a closer look at the trends reveals that the loyalty program surpassed the non-loyalty program in total sales in 2021 and in Average Order Value (AOV) in 2022. Evidence suggests that the loyalty program's AOV has been steadily growing, as opposed to the volatile non-loyalty program. 

<p align='center'>
<img width="1000" alt="Screenshot 2024-10-27 164841" src="https://github.com/user-attachments/assets/45f9d3f9-a15d-4743-9d19-aad69ed6a0f6">
</p>

## Refund Rates
Gaming monitors and laptops have consistently made up most of our refunds (X%). Looking at broader refund trends, 2021, overall refund rates decreased (X%), an unusual trend since sales and refunds usually increase in tandem. Higher sales but fewer returns in 2021 might be due to missing refund data, indicating either tracking issues or a potential no-refund policy. If this policy began in 2021, it would significantly influence purchasing decisions and customer satisfaction as well as explaining the lack of refund data for 2022.

<p align='center'>
<img width="1000" alt="Screenshot 2024-10-27 172645" src="https://github.com/user-attachments/assets/e1c2fe63-8ac7-43f4-bee2-2521b1b6b603">
</p>

# Recommendations

## Sales 
Body Text

## Product 
Body Text

## Loyalty Program
Body Text

## Refund Rates
*  Gaming monitors and laptops consistently account for the majority of refunds. This highlights potential areas for improvement, such as product quality checks or enhanced customer support for these items. Understanding why these specific categories dominate refunds could offer actionable insights to reduce return rates and improve customer satisfaction.
*  Investigate 2021 trends to further analyze why refunds decreased despite increased sales. Identify specific changes that impacted this period, which could help maintain a low refund rate.
*  Confirm whether a no-refund policy was implemented or if no data was collected in 2022.
