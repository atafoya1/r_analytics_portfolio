# An exploratory data analysis project exploring 55,500 patient records
# using R and ggplot2. The workflow included cleaning billing anomalies,managing
# data types, and generating multi variable visualizations to evaluate hospital
# billing distributions across various medical conditions and admission types,
# highlighting structural patterns characteristic of fake healthcare data. For 
# illustrative purposes only, demonstrating abilities.



healthcare_data <- read.csv('data/healthcare_dataset.csv')

summary(healthcare_data)

head(healthcare_data)

dim(healthcare_data)

str(healthcare_data)

colSums(is.na(healthcare_data))

#Billing amt minimum is negative, will explore this

# Review negative billing amounts
negative_bills <- healthcare_data[healthcare_data$Billing.Amount < 0, ]

print(paste("Number of negative billing records:", nrow(negative_bills))) #108 negative billing records

# Clean billing data converting negative values to absolute values
# Let's take the absolute value assuming they represent refunds/adjustments, or filter them out:
healthcare_data$Billing.Amount <- abs(healthcare_data$Billing.Amount)

# Aggregate: Find the average billing amount by Medical Condition
aggregate(Billing.Amount ~ Medical.Condition, data = healthcare_data, FUN = mean)
# uniform billing likely due to fake data, real world will have variance

# Check the distribution of Admission Types
table(healthcare_data$Admission.Type)
# same here, fake data showing similar volume for each admission type

library(ggplot2)

# bar chart for average billing by medical condition
ggplot(healthcare_data, aes(x = Medical.Condition, y = Billing.Amount, fill = Medical.Condition)) +
  geom_bar(stat = "summary", fun = "mean", show.legend = FALSE) +
  theme_minimal() +
  labs(
    title = "Average Billing Amount by Medical Condition",
    subtitle = "Healthcare Dataset Analysis",
    x = "Medical Condition",
    y = "Average Billing Amount ($)"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# boxplot for billing distribution by admission type
ggplot(healthcare_data, aes(x = Admission.Type, y = Billing.Amount, fill = Admission.Type)) +
  geom_boxplot(alpha = 0.7) +
  theme_minimal() +
  labs(
    title = "Billing Amount Distribution by Admission Type",
    subtitle = "Healthcare Dataset Exploration",
    x = "Admission Type",
    y = "Billing Amount ($)"
  ) +
  theme(legend.position = "none")
