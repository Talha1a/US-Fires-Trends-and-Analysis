CREATE TABLE us_fires_data (
     X FLOAT8,
     Y FLOAT8,
    OBJECTID SERIAL PRIMARY KEY,
    REVDATE DATE,
    FIRENAME VARCHAR(255),
    FIREYEAR INT,
    UNIQFIREID VARCHAR(255),
    DISCOVERYDATETIME TIMESTAMP,
    SIZECLASS VARCHAR(10),
    TOTALACRES DOUBLE PRECISION,
    STATCAUSE VARCHAR(255),
    DATASOURCE VARCHAR(255),
    OWNERAGENCY VARCHAR(255),
    PROTECTIONAGENCY VARCHAR(255),
    LATDD83 DOUBLE PRECISION,
    LONGDD83 DOUBLE PRECISION,
    FIRETYPECATEGORY VARCHAR(255),
    POINTTYPE VARCHAR(255),
    PERIMEXISTS VARCHAR(255),
    FIRERPTQC VARCHAR(255),
    DBSOURCEID VARCHAR(255),
    DBSOURCEDATE DATE
);

COPY us_fires_data FROM 'D:\OneDrive - University of Engineering and Technology Taxila\Desktop\LA FIRES PROJECT\cleaned_fire_data.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM us_fires_data 

--Top Causes of Fires

SELECT STATCAUSE, COUNT(*) AS fire_count
FROM us_fires_data
GROUP BY STATCAUSE
ORDER BY fire_count DESC
LIMIT 5;


--  Largest Fires by Total Acres

SELECT FIRENAME, TOTALACRES, FIREYEAR, STATCAUSE
FROM us_fires_data
ORDER BY TOTALACRES DESC
LIMIT 5;

--Fires by Year

SELECT FIREYEAR, COUNT(*) AS fire_count
FROM us_fires_data
GROUP BY FIREYEAR
ORDER BY FIREYEAR
LIMIT 10;

-- Fires with No Perimeter

SELECT FIRENAME, FIREYEAR, TOTALACRES, STATCAUSE
FROM us_fires_data
WHERE PERIMEXISTS = 'N'
ORDER BY FIREYEAR DESC
LIMIT 1000;

--  Total Acres Burned by Cause

SELECT STATCAUSE, SUM(TOTALACRES) AS total_acres_burned
FROM us_fires_data
GROUP BY STATCAUSE
ORDER BY total_acres_burned DESC;

-- Fires by Year and Cause

SELECT FIREYEAR,
       COUNT(CASE WHEN STATCAUSE = 'Natural' THEN 1 END) AS natural_fires,
       COUNT(CASE WHEN STATCAUSE = 'Human' THEN 1 END) AS human_fires,
       COUNT(CASE WHEN STATCAUSE = 'Unknown' THEN 1 END) AS unknown_fires
FROM us_fires_data
GROUP BY FIREYEAR
ORDER BY FIREYEAR DESC
LIMIT 20;

-- Fires by Agency and Their Total Impact

SELECT OWNERAGENCY, COUNT(*) AS fire_count, SUM(TOTALACRES) AS total_acres
FROM us_fires_data
GROUP BY OWNERAGENCY
ORDER BY total_acres DESC;

--Hotspots: Locations with the Most Fires

SELECT LATDD83, LONGDD83, COUNT(*) AS fire_count
FROM us_fires_data
WHERE LATDD83 != 0
GROUP BY LATDD83, LONGDD83
ORDER BY fire_count DESC
LIMIT 5;

-- Relationship Between Fire Size and Cause

SELECT STATCAUSE, 
       COUNT(*) AS fire_count, 
       AVG(TOTALACRES) AS avg_acres_burned,
       MAX(TOTALACRES) AS max_acres_burned
FROM us_fires_data
GROUP BY STATCAUSE
ORDER BY avg_acres_burned DESC;


