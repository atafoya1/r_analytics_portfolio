# r_analytics_portfolio

# Healthcare Dataset Exploratory Data Analysis in R

An exploratory data analysis project examining 55,500 patient records using R and `ggplot2`. The workflow focused on data cleaning, handling anomalies, and generating multi variable visualizations to evaluate hospital billing distributions across various medical conditions and admission types. For illustrative purpose only to demonstrate skillset

* **Language:** R
* **Environment:** RStudio
* **Libraries:** `ggplot2`

## Findings
* **Data Cleaning:** Processed the full 55,500 row dataset, verified zero missing values, and explored billing amounts (min was a negative value).
* **Insights:** Visualizations revealed that average billing amounts remain tightly clustered around $25,000 across all medical conditions and admission types, likely due to using fake data
* **Visualization:** Bar charts and boxplots using `ggplot2` to analyze billing spreads across emergency, urgent, and elective admissions.

## Files
* `healthcare_eda.R`: The primary R script containing the documented code, data cleaning steps, and visualization scripts.
* `healthcare_dataset.csv`: The dataset analyzed in this project.
