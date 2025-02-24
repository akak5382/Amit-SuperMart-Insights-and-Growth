---Part 1: Daily Insights
   ----Category Level Report: Analyze metrics such as Orders, GMV, Revenue, Customers, Live Products, and Live Stores for yesterday's data, with growth percentages for each metric.


select
Y.category,
Tday_orders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
Tday_GMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
Tday_Revenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
Tday_Customers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
Tday_Liveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
Tday_Livestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth

from
(select
X.category,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tday_orders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Yday_orders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as Tday_GMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as Yday_GMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as Tday_Revenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as Yday_Revenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as Tday_Customers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as Yday_Customers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as Tday_Liveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as Yday_Liveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as Tday_Livestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as Yday_Livestores

from(
select 
ph.category,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y


----Top 20 Brands Report: Identify the top-performing brands (based on GMV) and evaluate key metrics for yesterday's data, including growth trends.


select
Y.brand,
Tday_orders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
Tday_GMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
Tday_Revenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
Tday_Customers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
Tday_Liveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
Tday_Livestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth

from
(select
X.brand,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tday_orders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Yday_orders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as Tday_GMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as Yday_GMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as Tday_Revenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as Yday_Revenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as Tday_Customers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as Yday_Customers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as Tday_Liveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as Yday_Liveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as Tday_Livestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as Yday_Livestores

from(
select 
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y
order by 4 desc
limit 20


------Top 50 Products Report: Examine the performance of the top products (based on GMV), including their associated brands, to uncover sales and growth patterns for yesterday's data.

select
Y.product,
Y.brand,
Tday_orders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
Tday_GMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
Tday_Revenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
Tday_Customers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
Tday_Liveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
Tday_Livestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth

from
(select
X.product,
X.brand,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tday_orders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Yday_orders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as Tday_GMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as Yday_GMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as Tday_Revenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as Yday_Revenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as Tday_Customers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as Yday_Customers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as Tday_Liveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as Yday_Liveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as Tday_Livestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as Yday_Livestores

from(
select 
ph.product,
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1,2)Y
order by 5 desc
limit 50


-----StoreType_Id Report: Assess store-type performance based on Orders, GMV, Revenue, Customers, Live Products, and Live Stores for yesterday's data, including growth comparisons.

select
Y.storetypeid
Tday_orders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
Tday_GMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
Tday_Revenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
Tday_Customers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
Tday_Liveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
Tday_Livestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth

from
(select
X.storetypeid,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tday_orders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Yday_orders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as Tday_GMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as Yday_GMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as Tday_Revenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as Yday_Revenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as Tday_Customers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as Yday_Customers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as Tday_Liveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as Yday_Liveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as Tday_Livestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as Yday_Livestores

from(
select 
sc.storetypeid,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id
join datascience-434309.super_mart.store_cities_snapshot as sc
on sc.storeid=od.store_id)X
group by 1)Y
order by 1


-------Part 2: Month-To-Date (MTD) Insights
----Category Level Report: Provide an MTD summary of Orders, GMV, Revenue, Customers, Live Products, and Live Stores, along with growth percentages.

select
Y.category,
MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.category,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(
select 
ph.category,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y


-----Top 20 Brands Report: Highlight the top-performing brands for the MTD period, showcasing key metrics and their growth trends.


select
Y.brand,
MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.brand,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(

select 
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y
order by 2,3,4,5,6,7,8,9,10,11,12 desc
limit 20

----Top 50 Products Report: Focus on top product-level performance for the MTD period, including product and brand details.


select
Y.product,
Y.brand,
MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.product,
X.brand,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(
select 
ph.product,
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1,2)Y
order by 3,4,5,6,7 desc
limit 50


---StoreType_Id Report: Assess MTD store-type performance with key metrics and growth rates.


select
Y.storetypeid,
MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.storetypeid,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(
select 
sc.storetypeid,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id
join datascience-434309.super_mart.store_cities_snapshot as sc
on sc.storeid=od.store_id)X
group by 1)Y
order by 1

---Part 3: Last Month-To-Date (LMTD) Insights
----Category Level Report: Generate LMTD metrics such as Orders, GMV, Revenue, Customers, Live Products, and Live Stores, with growth percentages.


select
Y.category,
LMTD_orders,
coalesce(round((LMTD_orders-MTD_orders)/nullif (MTD_orders,0),2),0) as Order_growth,
LMTD_GMV,
coalesce(round((LMTD_GMV-MTD_GMV)/nullif (MTD_GMV,0),2),0) as GMV_growth,
LMTD_Revenue,
coalesce(round((LMTD_Revenue-MTD_Revenue)/nullif (MTD_Revenue,0),2),0) as Revenue_growth,
LMTD_Customers,
coalesce(round((LMTD_Customers-MTD_Customers)/nullif (MTD_Customers,0),2),0) as Customer_growth,
LMTD_Liveproduct,
coalesce(round((LMTD_Liveproduct-MTD_Liveproduct)/nullif (MTD_Liveproduct,0),2),0) as Liveproduct_growth,
LMTD_Livestores,
coalesce(round((LMTD_Livestores-MTD_Livestores)/nullif (MTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.category,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(
select 
ph.category,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y



----Top 20 Brands Report: Evaluate top-performing brands during the LMTD period, highlighting growth trends and sales contributions.


select
Y.brand,
LMTD_orders,
coalesce(round((LMTD_orders-MTD_orders)/nullif (MTD_orders,0),2),0) as Order_growth,
LMTD_GMV,
coalesce(round((LMTD_GMV-MTD_GMV)/nullif (MTD_GMV,0),2),0) as GMV_growth,
LMTD_Revenue,
coalesce(round((LMTD_Revenue-MTD_Revenue)/nullif (MTD_Revenue,0),2),0) as Revenue_growth,
LMTD_Customers,
coalesce(round((LMTD_Customers-MTD_Customers)/nullif (MTD_Customers,0),2),0) as Customer_growth,
LMTD_Liveproduct,
coalesce(round((LMTD_Liveproduct-MTD_Liveproduct)/nullif (MTD_Liveproduct,0),2),0) as Liveproduct_growth,
LMTD_Livestores,
coalesce(round((LMTD_Livestores-MTD_Livestores)/nullif (MTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.brand,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(

select 
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y
order by 5 desc
limit 20

-----Top 50 Products Report: Identify leading products based on GMV for the LMTD period, including brand and product details.

select
Y.product,
Y.brand,
LMTD_orders,
coalesce(round((LMTD_orders-MTD_orders)/nullif (MTD_orders,0),2),0) as Order_growth,
LMTD_GMV,
coalesce(round((LMTD_GMV-MTD_GMV)/nullif (MTD_GMV,0),2),0) as GMV_growth,
LMTD_Revenue,
coalesce(round((LMTD_Revenue-MTD_Revenue)/nullif (MTD_Revenue,0),2),0) as Revenue_growth,
LMTD_Customers,
coalesce(round((LMTD_Customers-MTD_Customers)/nullif (MTD_Customers,0),2),0) as Customer_growth,
LMTD_Liveproduct,
coalesce(round((LMTD_Liveproduct-MTD_Liveproduct)/nullif (MTD_Liveproduct,0),2),0) as Liveproduct_growth,
LMTD_Livestores,
coalesce(round((LMTD_Livestores-MTD_Livestores)/nullif (MTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.product,
X.brand,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(
select 
ph.product,
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1,2)Y
order by 5 desc
limit 50

----StoreType_Id Report: Assess LMTD store-type performance with key metrics and growth rates.


select
Y.storetypeid,
LMTD_orders,
coalesce(round((LMTD_orders-MTD_orders)/nullif (MTD_orders,0),2),0) as Order_growth,
LMTD_GMV,
coalesce(round((LMTD_GMV-MTD_GMV)/nullif (MTD_GMV,0),2),0) as GMV_growth,
LMTD_Revenue,
coalesce(round((LMTD_Revenue-MTD_Revenue)/nullif (MTD_Revenue,0),2),0) as Revenue_growth,
LMTD_Customers,
coalesce(round((LMTD_Customers-MTD_Customers)/nullif (MTD_Customers,0),2),0) as Customer_growth,
LMTD_Liveproduct,
coalesce(round((LMTD_Liveproduct-MTD_Liveproduct)/nullif (MTD_Liveproduct,0),2),0) as Liveproduct_growth,
LMTD_Livestores,
coalesce(round((LMTD_Livestores-MTD_Livestores)/nullif (MTD_Livestores,0),2),0) as LiveStore_growth

from
(select
X.storetypeid,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores

from(
select 
sc.storetypeid,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id
join datascience-434309.super_mart.store_cities_snapshot as sc
on sc.storeid=od.store_id)X
group by 1)Y
order by 1


---Part 4: Last Month (LM) Insights

----Category Level Report: Summarize LM metrics, including Orders, GMV, Revenue, Customers, Live Products, and Live Stores, with growth comparisons


select
Y.category,
LM_orders,
coalesce(round((LM_orders-PLM_orders)/nullif (PLM_orders,0),2),0) as Order_growth,
LM_GMV,
coalesce(round((LM_GMV-PLM_GMV)/nullif (PLM_GMV,0),2),0) as GMV_growth,
LM_Revenue,
coalesce(round((LM_Revenue-PLM_Revenue)/nullif (PLM_Revenue,0),2),0) as Revenue_growth,
LM_Customers,
coalesce(round((LM_Customers-PLM_Customers)/nullif (PLM_Customers,0),2),0) as Customer_growth,
LM_Liveproduct,
coalesce(round((LM_Liveproduct-PLM_Liveproduct)/nullif (PLM_Liveproduct,0),2),0) as Liveproduct_growth,
LM_Livestores,
coalesce(round((LM_Livestores-PLM_Livestores)/nullif (PLM_Livestores,0),2),0) as LiveStore_growth

from
(select
X.category,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.order_id) end) as PLM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.GMV) end) as PLM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.selling_price)/1.18 end) as PLM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Customers) end) as PLM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Products) end) as PLM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Stores) end) as PLM_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
ph.category,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y


---Top 20 Brands Report: Identify the best-performing brands for LM, highlighting their contributions and growth trends.


select
Y.brand,
LM_orders,
coalesce(round((LM_orders-PLM_orders)/nullif (PLM_orders,0),2),0) as Order_growth,
LM_GMV,
coalesce(round((LM_GMV-PLM_GMV)/nullif (PLM_GMV,0),2),0) as GMV_growth,
LM_Revenue,
coalesce(round((LM_Revenue-PLM_Revenue)/nullif (PLM_Revenue,0),2),0) as Revenue_growth,
LM_Customers,
coalesce(round((LM_Customers-PLM_Customers)/nullif (PLM_Customers,0),2),0) as Customer_growth,
LM_Liveproduct,
coalesce(round((LM_Liveproduct-PLM_Liveproduct)/nullif (PLM_Liveproduct,0),2),0) as Liveproduct_growth,
LM_Livestores,
coalesce(round((LM_Livestores-PLM_Livestores)/nullif (PLM_Livestores,0),2),0) as LiveStore_growth

from
(select
X.brand,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.order_id) end) as PLM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.GMV) end) as PLM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.selling_price)/1.18 end) as PLM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Customers) end) as PLM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Products) end) as PLM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Stores) end) as PLM_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y
order by 2,3,4,5,6,7,8,9,10,11,12 desc
limit 20


---Top 50 Products Report: Explore LM performance at the product level, including GMV contributions and associated brand insights.


select
Y.product,
Y.brand,
LM_orders,
coalesce(round((LM_orders-PLM_orders)/nullif (PLM_orders,0),2),0) as Order_growth,
LM_GMV,
coalesce(round((LM_GMV-PLM_GMV)/nullif (PLM_GMV,0),2),0) as GMV_growth,
LM_Revenue,
coalesce(round((LM_Revenue-PLM_Revenue)/nullif (PLM_Revenue,0),2),0) as Revenue_growth,
LM_Customers,
coalesce(round((LM_Customers-PLM_Customers)/nullif (PLM_Customers,0),2),0) as Customer_growth,
LM_Liveproduct,
coalesce(round((LM_Liveproduct-PLM_Liveproduct)/nullif (PLM_Liveproduct,0),2),0) as Liveproduct_growth,
LM_Livestores,
coalesce(round((LM_Livestores-PLM_Livestores)/nullif (PLM_Livestores,0),2),0) as LiveStore_growth

from
(select
X.product,
X.brand,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.order_id) end) as PLM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.GMV) end) as PLM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.selling_price)/1.18 end) as PLM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Customers) end) as PLM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Products) end) as PLM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Stores) end) as PLM_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
ph.product,
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1,2)Y
order by 3 desc
limit 50


------StoreType_Id Report: Analyze store-type performance for LM, identifying growth trends and patterns.

select
Y.storetypeid,
LM_orders,
coalesce(round((LM_orders-PLM_orders)/nullif (PLM_orders,0),2),0) as Order_growth,
LM_GMV,
coalesce(round((LM_GMV-PLM_GMV)/nullif (PLM_GMV,0),2),0) as GMV_growth,
LM_Revenue,
coalesce(round((LM_Revenue-PLM_Revenue)/nullif (PLM_Revenue,0),2),0) as Revenue_growth,
LM_Customers,
coalesce(round((LM_Customers-PLM_Customers)/nullif (PLM_Customers,0),2),0) as Customer_growth,
LM_Liveproduct,
coalesce(round((LM_Liveproduct-PLM_Liveproduct)/nullif (PLM_Liveproduct,0),2),0) as Liveproduct_growth,
LM_Livestores,
coalesce(round((LM_Livestores-PLM_Livestores)/nullif (PLM_Livestores,0),2),0) as LiveStore_growth

from
(select
X.storetypeid,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.order_id) end) as PLM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.GMV) end) as PLM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.selling_price)/1.18 end) as PLM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Customers) end) as PLM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Products) end) as PLM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-06-01' and '2024-06-30' then (X.Live_Stores) end) as PLM_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
sc.storetypeid,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id
join datascience-434309.super_mart.store_cities_snapshot as sc
on sc.storeid=od.store_id)X
group by 1)Y
order by 1