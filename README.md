Project Description: SuperMart Insights and Growth

Description
This project aims to analyze SuperMart's key performance indicators (KPIs) across multiple dimensions, including categories, brands, products, and store types, using dynamic datasets. By leveraging advanced data analytics tools like MySQL Workbench and BigQuery, we generate actionable insights to drive business decisions and growth strategies.

Objectives:
The project is divided into four distinct parts, each focusing on specific temporal and hierarchical perspectives to measure growth and performance.
________________________________________

Part 1: Daily Insights
Generate daily reports to evaluate SuperMart's performance at different levels of granularity:
1.	Category Level Report: Analyze metrics such as Orders, GMV, Revenue, Customers, Live Products, and Live Stores for yesterday's data, with growth percentages for each metric.
2.	Top 20 Brands Report: Identify the top-performing brands (based on GMV) and evaluate key metrics for yesterday's data, including growth trends.
3.	Top 50 Products Report: Examine the performance of the top products (based on GMV), including their associated brands, to uncover sales and growth patterns for yesterday's data.
4.	StoreType_Id Report: Assess store-type performance based on Orders, GMV, Revenue, Customers, Live Products, and Live Stores for yesterday's data, including growth comparisons.
________________________________________

Part 2: Month-To-Date (MTD) Insights
Track cumulative monthly performance for deeper trend analysis:
1.	Category Level Report: Provide an MTD summary of Orders, GMV, Revenue, Customers, Live Products, and Live Stores, along with growth percentages.
2.	Top 20 Brands Report: Highlight the top-performing brands for the MTD period, showcasing key metrics and their growth trends.
3.	Top 50 Products Report: Focus on top product-level performance for the MTD period, including product and brand details.
4.	StoreType_Id Report: Analyze store-type performance metrics for the MTD period, identifying growth trends.
________________________________________

Part 3: Last Month-To-Date (LMTD) Insights
Compare performance trends by analyzing last month's data until the same day as the current period:
1.	Category Level Report: Generate LMTD metrics such as Orders, GMV, Revenue, Customers, Live Products, and Live Stores, with growth percentages.
2.	Top 20 Brands Report: Evaluate top-performing brands during the LMTD period, highlighting growth trends and sales contributions.
3.	Top 50 Products Report: Identify leading products based on GMV for the LMTD period, including brand and product details.
4.	StoreType_Id Report: Assess LMTD store-type performance with key metrics and growth rates.
________________________________________

Part 4: Last Month (LM) Insights
Provide a comprehensive analysis of last month's performance to identify recurring trends:
1.	Category Level Report: Summarize LM metrics, including Orders, GMV, Revenue, Customers, Live Products, and Live Stores, with growth comparisons.
2.	Top 20 Brands Report: Identify the best-performing brands for LM, highlighting their contributions and growth trends.
3.	Top 50 Products Report: Explore LM performance at the product level, including GMV contributions and associated brand insights.
4.	StoreType_Id Report: Analyze store-type performance for LM, identifying growth trends and patterns.
________________________________________

Technical Implementation:
•	Data Sources:
o	order_details_v1: Provides detailed information on customer orders, including product, store, and transactional data.
o	product_hierarchy_v1: Contains details on product categories and brands.
o	store_cities_v1: Includes store type and location-specific details.
•	Tools and Platforms:
o	MySQL Workbench: Used for executing SQL queries and generating reports dynamically.
o	BigQuery: Leveraged for handling large datasets, complex queries, and scalable reporting.
•	Dynamic Date Functionality:
The queries are designed with a dynamic date component to ensure automated reporting for daily, MTD, LMTD, and LM data without manual intervention.
________________________________________

Key Metrics Analyzed:
•	Orders: Total count of customer orders.
•	GMV: Gross Merchandise Value, reflecting the total value of goods sold.
•	Revenue: Net earnings after discounts and refunds.
•	Customers: Total number of unique customers.
•	Live Products: Count of active products available for purchase.
•	Live Stores: Number of operational stores.
•	Growth %: Percentage change in performance metrics over comparable timeframes.
________________________________________

Expected Outcomes:
•	Identification of top-performing categories, brands, and products.
•	Insights into customer behavior and regional performance trends by store type.
•	Automated, dynamic reports for real-time decision-making and long-term planning.
•	Enhanced ability to track growth and performance across different timeframes, driving better resource allocation and strategy formulation.

This project forms the foundation for a data-driven approach to improving retail operations, optimizing inventory, and enhancing customer satisfaction at SuperMart.
The entire project must be completed and submitted within 7 days, with reports addressing the questions and requirements outlined in the attached file.
 

