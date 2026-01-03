use realestate_db;
select * from realestate;

describe realestate;

--  Phase-1.1
select count(*) from realestate;
--  Phase-1.2
SELECT status, COUNT(*) as total_properties
FROM realestate
GROUP BY status
ORDER BY total_properties DESC;
--  Phase-1.3
Select * from realestate where price is null;

--  Phase-1.4
SELECT status, COUNT(*) 
FROM realestate
GROUP BY status;
-- phase one completed.....
/***********************************************************************/
-- Phase 2.1 price range 
select max(price) as maxprice from realestate;
select min(price) as minprice from realestate;

-- Phase 2.2 type of the price average...
select avg(price) as averagePrice from realestate;

-- Phase 2.3 OUTLIER CHECK (VERY IMPORTANT)
select * from realestate order by price desc limit 10;

-- “The dataset contains a highly skewed price distribution with a small number 
-- of ultra-luxury listings significantly inflating the average price. 
-- While high-end prices appear legitimate for certain locations, 
-- very low prices may require further validation.”

/* phase two completed........ */

/***********************************************************************/

/* PHASE 3 — LOCATION-BASED PRICE ANALYSIS (SQL EDA) */
-- Phase 3.1 AVERAGE PRICE BY CITY

Select city,avg(price) as average_price from realestate 
group by city order by average_price desc limit 10;

-- Phase 3.2 LISTING COUNT BY CITY
Select city,count(*) as total_listing from realestate 
group by city order by total_listing desc limit 10;

/* Cities with the highest average prices are not necessarily the cities with the highest number of listings,
 indicating a clear separation between luxury markets and high-volume markets */

/***********************************************************************/

-- 🔥 PHASE 4 — HOW PROPERTY FEATURES AFFECT PRICE

-- 🧪 PHASE 4 — STEP 1: PRICE vs BEDROOMS

Select * from realestate;

Select bed,avg(price) as average_price_on_bed from realestate 
group by bed order by bed asc;


-- 🧪 PHASE 4 — STEP 2: PRICE vs BATHROOMS 

Select bath ,avg(price) as average_price_on_bed from realestate 
group by bath order by bath asc;

/* “Property prices increase with both bedroom and bathroom count, 
with bathrooms showing a stronger premium effect—especially in the luxury segment.” */


-- 🧪 PHASE 4 — STEP 3: PRICE vs HOUSE SIZE (VERY IMPORTANT)
-- way 1..........................
SELECT
  house_levels,
  AVG(price) AS avg_price
FROM (
    SELECT
      price,
      CASE
        WHEN house_size < 1000 THEN 'Small'
        WHEN house_size BETWEEN 1000 AND 2000 THEN 'Medium'
        WHEN house_size BETWEEN 2000 AND 4000 THEN 'Large'
        WHEN house_size > 4000 THEN 'Luxury'
      END AS house_levels
    FROM realestate
    WHERE house_size IS NOT NULL
) temp_data
GROUP BY house_levels
ORDER BY avg_price;

-- another way to soving this problem --way 2
 Create view temp_data as 
	SELECT
      price,
      CASE
        WHEN house_size < 1000 THEN 'Small'
        WHEN house_size BETWEEN 1000 AND 2000 THEN 'Medium'
        WHEN house_size BETWEEN 2000 AND 4000 THEN 'Large'
        WHEN house_size > 4000 THEN 'Luxury'
      END AS house_levels
    FROM realestate
    WHERE house_size IS NOT NULL;
    
select house_levels,avg(price) from temp_data group by house_levels;





/***********************************************************************/
-- 🚀 PHASE 5 — DATA CLEANING & VALIDATION (ADVANCED EDA)

-- 🧪 PHASE 5 — STEP 1: UNDERSTAND THE DISTRIBUTION
-- Profile numeric range

select min(acre_lot) as min_acre,
	   max(acre_lot) as max_acre
       from realestate
       where acre_lot is not null;

-- 🧪 PHASE 5 — STEP 2: count unrealisic values

select count(*) as invalid_acre_count from realestate where acre_lot<0;

select * from realestate;

-- Now run your update again
UPDATE realestate 
SET acre_lot = NULL 
WHERE TRIM(acre_lot) = '';

-- (Optional) Turn safety back on if you want

/* --“Although acre_lot was stored as a numeric value, EDA revealed extreme and unrealistic values. 
Instead of forcing transformations or replacing NULLs with text, I preserved data integrity by either filtering valid ranges or excluding the column,
 ensuring analytical accuracy.” */  
