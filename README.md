# Yelp-Data-Analysis
Yelp Data Analysis
Thanks! Here's your updated **README.md** file, now incorporating the specific `analyse_sentiment` Python UDF used in Snowflake with the `textblob` package.

---

# 📊 Yelp Data Analytics Project

This project performs sentiment analysis and exploratory data analysis (EDA) on Yelp reviews using a combination of AWS S3, Snowflake, and SQL. It utilizes the publicly available [Yelp Open Dataset](https://business.yelp.com/data/resources/open-dataset/) and demonstrates how cloud technologies and modern data platforms can be used to manage and analyze large-scale JSON data.

---

## 📁 Data Source

- **Yelp Open Dataset**  
  Access the dataset here: [Yelp Data Licensing](https://business.yelp.com/data/resources/open-dataset/)  
  This dataset includes millions of reviews, business data, user information, and more, structured in JSON format.

---

## ⚙️ Workflow Overview

1. **Data Preparation and Upload** – Split and upload data to AWS S3.
2. **Data Ingestion** – Connect Snowflake to AWS and load data.
3. **Data Transformation** – Convert JSON into relational tables.
4. **Sentiment Analysis** – Classify reviews using a custom Python UDF in Snowflake.
5. **Exploratory Data Analysis (EDA)** – Perform SQL-based insights extraction.

---

## 🔄 Process Breakdown

### 1. Split and Upload JSON Reviews

- Due to the large size of the original review dataset, it was split into smaller chunks.
- This facilitates faster and error-free uploading to cloud storage.
- **Tool Used**: Python script to split JSON files (optional, not included in repo).

### 2. Create Amazon S3 Bucket

- A new bucket named `yelpdataanalysis` was created on AWS S3.
- A folder `yelpreviews` inside the bucket holds all the review data chunks.


### 3. Snowflake-AWS Integration

- Generated AWS Access and Secret Keys to enable external stage configuration.
- In Snowflake:
  - Created an **external stage** pointing to the S3 bucket.
  - Configured file format (JSON).
  - Verified access and file visibility via `LIST @stage_name;`.

### 4. Load JSON Data into Snowflake

- Leveraged the `COPY INTO` command to load raw JSON data into Snowflake tables.
- Set up a **variant column** to temporarily store semi-structured JSON.
- Transformed data into structured format using `FLATTEN` and `LATERAL` joins.

### 5. Sentiment Analysis Using Python UDF

A custom Python UDF was created in Snowflake using the `textblob` package to classify each review into **Positive**, **Negative**, or **Neutral** based on sentiment polarity.



## 📊 Exploratory Data Analysis (EDA)

Performed various analyses using SQL, including:

- Most reviewed businesses
- Average sentiment scores per location or category
- Rating vs sentiment correlation
- Temporal patterns in reviews (monthly/seasonal trends)

---

## 🛠️ Tools & Technologies

- **AWS S3** – Cloud storage for raw Yelp dataset

<img width="1668" alt="Screenshot 2025-04-21 at 10 44 10 PM" src="https://github.com/user-attachments/assets/d966e1ef-4563-44e5-b90e-f5691b5f27c5" />


- **Snowflake** – Cloud data warehousing and SQL execution

<img width="1668" alt="Screenshot 2025-04-21 at 10 42 52 PM" src="https://github.com/user-attachments/assets/fba85efb-dfef-472e-878b-afb9b81488ac" />


- **Python UDFs** – Used for sentiment analysis
- **TextBlob** – Python library for basic NLP
- **SQL** – Used for data wrangling and analytics

---

## 🚀 Future Enhancements

- Incorporate advanced NLP models (e.g., BERT, VADER) for more nuanced sentiment scoring.
- Integrate additional Yelp data files like businesses, users, and check-ins.
- Automate ingestion with Snowpipe and AWS Lambda.
- Add an interactive dashboard using Streamlit or Dash.
