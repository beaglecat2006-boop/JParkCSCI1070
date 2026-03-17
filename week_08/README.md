### Team Members
* **Working alone:** [Jamie Park]

### Project Plan
* **Time Dedication:** I plan to dedicate 3 hours to writing queries and testing joins.
* **Coordination:** N/A (Working Alone)

### Dataset
* I am using the **Pagila/Sakila** database. It is a relational dataset with tables for **Payment**, **Customer**, and **Rental**.

### Hypotheses
* **Null Hypothesis (H0):** For the Pagila dataset, there will be no difference between the **SUM(amount)** of payments from Store 1 and Store 2.
* **Alternative Hypothesis (H1):** For the Pagila dataset, there will be a difference in the **SUM(amount)** of payments between the two store locations.

### Planned Models
* I plan to apply **SQL Aggregations** (SUM, COUNT) and **JOINS** first. 
* I will use a **LEFT JOIN** to connect the payment table to the staff table on staff_id to see which store location is generating more revenue.
