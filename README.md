# US-Fires-Trends-and-Analysis
![Dashboard Overview](https://github.com/Talha1a/US-Fires-Trends-and-Analysis/blob/main/Final%20dashboard.png)

## Project Overview
This project aims to analyze trends, causes, and impacts of fires in the United States using a dataset obtained from Government's Data site. The analysis includes data cleaning and visualization in Python, querying and extracting insights using SQL, and creating an interactive dashboard using Power BI.

---

## Dataset
**Name:** US Fires Dataset  
**Source:** [National -US- Fire- Occuring-Points](https://catalog.data.gov/dataset/national-usfs-fire-occurrence-point-feature-layer-d3233)  
**Format:** CSV  
**Description:** The dataset includes detailed information about fire events such as location, size, cause, and managing agencies.

---

## Steps in the Project

### 1. Data Cleaning and Preprocessing (Python)

**Tools Used:** Python (Pandas, NumPy, Matplotlib, Seaborn)  
**Steps:**
1. **Load Data:** Imported the dataset using `pandas.read_csv()`.
2. **Handling Missing Values:**
   - Replaced or imputed missing data in key columns like `STATCAUSE` and `OWNERAGENCY` and other colomns.
   - Assigned default values for boolean fields with missing entries.
3. **Data Type Conversion:**
   - Converted columns such as `DISCOVERYDATETIME` to `datetime` format.
   - Ensured numeric fields like `TOTALACRES` and `LATDD83` were properly formatted.
4. **Exploratory Data Analysis (EDA):**
   - Generated summary statistics.
   - Visualized trends and outliers using Matplotlib and Seaborn (e.g., boxplots, line charts).
   - ![Python Plot for Fires Trend by Month](https://github.com/Talha1a/US-Fires-Trends-and-Analysis/blob/main/bar%20plot2.png)
   - ![Cont of Fires by Year(1990-2024)](https://github.com/Talha1a/US-Fires-Trends-and-Analysis/blob/main/line%20plot.png)
5. **Export Cleaned Data:**
   - Saved the cleaned dataset to a new CSV file for SQL and Power BI integration.

### 2. SQL for Data Analysis

**Database:** PostgreSQL  
**Steps:**
1. **Table Creation:**
   - Created a table named `us_fires_data` with properly defined schema, including primary keys and appropriate data types.
   - Example: `OBJECTID SERIAL PRIMARY KEY`, `TOTALACRES DOUBLE PRECISION`.
2. **Data Import:**
   - Loaded the cleaned CSV data into the PostgreSQL table using the `COPY` command.
3. **Key Queries:**
   - Extracted trends in fire size (`TOTALACRES`) by year and cause.
   - Analyzed the impact of different agencies (`OWNERAGENCY`) on fire containment.
   - Identified the most common causes of fires by region and time.
   - Evaluated fire frequency and severity by `SIZECLASS`.
  
   - ![Cause of Fires](https://github.com/Talha1a/US-Fires-Trends-and-Analysis/blob/main/Querry%201.png)
   - ![Fire name, Area burnt , Year and Cause](https://github.com/Talha1a/US-Fires-Trends-and-Analysis/blob/main/Querry%202.png)
4. **Advanced Insights:**.
   - Created temporary views for complex aggregations.

### 3. Power BI Dashboard

**Tools Used:** Power BI  
**Steps:**
1. **Data Connection:** Imported cleaned data from the CSV file .
2. **Slicers:** Added slicers for:
   - `STATCAUSE`
   - `OWNERAGENCY`
   - `FIREYEAR`
3. **KPIs:**
   - Total fire events (`Count of OBJECTID`).
   - Total area burned (`Sum of TOTALACRES`).
   - Maximum area burned in a single event.
4. **Charts and Visuals:**
   - Line chart: Fire trends over years (`Count of OBJECTID` vs. `FIREYEAR`).
   - Stacked bar chart: Fires by cause and agency (`Count of OBJECTID` vs. `STATCAUSE`).
   - Map visualization: Fire locations using `LATDD83` and `LONGDD83`.
   - Area chart: Total acres burned over time by cause.
5. **Interactive Dashboard:**
   - Organized visuals with an intuitive layout.
   - Applied consistent color themes (e.g., blue for severity, green for successful containment).
   
## Insights

1. **Top Cause of Fires**: Lightning was identified as the leading cause of fires.
2. **Year with Most Fires**: Fire incidents peaked in the year 2000.
3. **Size Class Distribution**: Fires of size class "A" were most common.

## How to Run the Project

### 1. Python Setup
1. Install the required libraries:
   ```bash
   pip install pandas numpy matplotlib seaborn psycopg2
   ```
2. Run the Jupyter Notebook in the `notebooks/` folder to clean and preprocess the dataset.

### 2. PostgreSQL Setup
1. Create a new database and table using the schema defined in `sql_queries.sql`.
2. Load the cleaned data into the table using the `COPY` command.

### 3. Power BI
1. Open the `power_bi.pbix` file in Power BI Desktop.
2. Refresh the data to connect with the latest cleaned dataset or SQL database.
3. Interact with the dashboard to explore trends and insights.

---

## Key Insights
- **Trend Analysis:** Fires have increased over the years, with significant spikes in certain decades.
- **Cause Analysis:** Lightning remains the most common cause, while human-related causes are growing.
- **Agency Impact:** Certain agencies are more effective in managing fires based on fire size and frequency.

---

## Contributing
Feel free to open issues or submit pull requests to enhance the project. Suggestions for additional features or insights are welcome!
