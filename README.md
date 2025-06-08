# Zuber Ride-Sharing Data Analysis — Chicago, November 2017

## Project Description

**Zuber**, a new ride-sharing company launching in **Chicago**, seeks to understand **passenger behavior** and the **impact of external factors** on ride patterns by analyzing data from competitors and historical weather.

This project involves:
- **Exploratory Data Analysis (SQL and Python)**
- **Weather Data Integration**
- **Hypothesis Testing**
- **Data Visualization**

We analyze relationships between taxi rides, company performance, and **weather impact**, especially on trips between The Loop and O’Hare Airport.

---

## Data Sources

The database includes the following tables:

### `neighborhoods`
| Column            | Description                          |
|------------------|--------------------------------------|
| `name`           | Neighborhood name                    |
| `neighborhood_id`| Neighborhood unique ID               |

### `cabs`
| Column            | Description                          |
|------------------|--------------------------------------|
| `cab_id`         | Internal vehicle code                |
| `vehicle_id`     | Vehicle’s technical ID               |
| `company_name`   | Name of the taxi company             |

### `trips`
| Column               | Description                               |
|---------------------|-------------------------------------------|
| `trip_id`           | Ride ID                                   |
| `cab_id`            | Vehicle operating the ride                |
| `start_ts`, `end_ts`| Start and end timestamps (hour-rounded)   |
| `duration_seconds`  | Trip duration                             |
| `distance_miles`    | Trip distance                             |
| `pickup_location_id`, `dropoff_location_id` | Pickup/drop-off neighborhood IDs |

### `weather_records`
| Column         | Description                             |
|----------------|-----------------------------------------|
| `record_id`    | Weather record ID                       |
| `ts`           | Timestamp (hour-rounded)                |
| `temperature`  | Recorded temperature                    |
| `description`  | Weather condition (e.g., rain, snow)    |

**Note:** Weather and trip data are linked using the timestamp fields: `start_ts` from `trips` and `ts` from `weather_records`.

---

## Project Steps

### 1. Web Scraping: Weather in Chicago (Nov 2017)
- Parsed weather data from:
  [Chicago Weather](https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html)

### 2. SQL-Based Analysis
- Analyzed ride frequency for:
  - November 15–16
  - November 1–7 for "Yellow"/"Blue" companies
  - Comparison between Flash Cab, Taxi Affiliation Services, and Others
- Used CASE logic to define **"Good" vs "Bad" weather** based on `description` field
- Identified rides from **The Loop (id: 50)** to **O’Hare (id: 63)** on **Saturdays** with weather conditions and duration

### 3. Python: Data Cleaning & Visualization
Analyzed two CSVs:
- `project_sql_result_01.csv`: Company vs ride counts (Nov 15–16)
- `project_sql_result_04.csv`: Neighborhood drop-off averages (Nov 2017)

Tasks:
- Import, inspect and clean data
- Validate column types
- Identify top 10 drop-off neighborhoods
- Plot:
  - Number of rides per company
  - Average drop-offs by neighborhood
- Draw conclusions from visual trends

### 4. Hypothesis Testing in Python

CSV: `project_sql_result_07.csv`
| Column              | Description                      |
|---------------------|----------------------------------|
| `start_ts`          | Ride start timestamp             |
| `weather_conditions`| "Good" or "Bad" (from SQL CASE)  |
| `duration_seconds`  | Ride duration in seconds         |

**Hypothesis:**
> "The average duration of rides from the Loop to O'Hare International Airport changes on rainy Saturdays."

- **H₀ (Null Hypothesis)**: The mean ride duration is the same in "Good" and "Bad" weather.
- **H₁ (Alternative Hypothesis)**: The mean ride duration differs depending on weather conditions.

- **Test Used**: Independent samples **t-test**  
  Justification: Compares means between two unrelated groups ("Good" and "Bad" weather)

- **α (Significance Level)**: Chosen as `0.05`

---

## Technologies Used

- **SQL** (PostgreSQL): Queries and CASE logic
- **Python**: Data analysis, hypothesis testing
- **Libraries**:
  - `pandas`, `numpy` – data manipulation
  - `matplotlib`, `seaborn` – visualization
  - `scipy.stats` – hypothesis testing
  - `beautifulsoup4`, `requests` – web scraping
- **Jupyter Notebook** – interactive analysis

---


## Key Insights

- Flash Cab and Taxi Affiliation Services dominated ride volume in November 2017.
- Drop-offs were highest in downtown neighborhoods like Loop and Near North Side.
- Hypothesis testing showed  a **significant impact** (if p < 0.05), depending on our test result.

---





