# Predictive Analytics for Loan Default Risk (SAS Enterprise Miner)

This project explores the use of predictive modeling to identify borrowers likely to experience serious loan default within two years. Built using SAS Enterprise Miner, the project leverages real-world credit behavior data to train and evaluate logistic regression and decision tree models.

## 🔍 Business Problem
How can financial institutions predict serious loan default risk using borrower characteristics such as income, credit history, and payment behavior?

## 📊 Tools & Skills Applied
- **Tools**: SAS Enterprise Miner, Excel  
- **Skills**: Data Imputation, Outlier Handling, Data Transformation, Logistic Regression, Decision Tree Modeling, Model Evaluation (ASE, Lift, Misclassification)

## 🧾 Dataset
- Source: [Give Me Some Credit Dataset – Kaggle](https://www.kaggle.com/datasets/brycecf/give-me-some-credit-dataset) by Bryce Freshcorn  
- Target variable: `SeriousDlqin2yrs` (1 = default, 0 = no default)

## ✅ Key Insights
- Only ~6.7% of borrowers in the dataset defaulted, revealing a significant class imbalance.
- The **decision tree model** slightly outperformed logistic regression in validation ASE (0.0483 vs. 0.0503).
- Most predictive features: `NumberOfTimes90DaysLate`, `RevolvingUtilizationOfUnsecuredLines`, and `NumberOfTime60-89DaysPastDueNotWorse`.
- Both models achieved lift values >6 in the top decile — enabling high-precision targeting of risk-prone borrowers.

### 📉 Model Performance Example:
![Decision Tree Lift Chart](images/decision-tree-lift.png)
![Logistic Regression Lift Chart](images/logistic_regression_lift.png)

## 📈 Outcomes
- Logistic regression provides strong interpretability and regulatory justification.
- Decision tree enhances segmentation, automation, and model clarity for credit scoring teams.
- The project supports smarter, data-driven loan approval workflows.

## 📂 Project Downloads

📘 [Download Project Summary Report (Word Doc)](Project-Files/Predictive_Analytics_for_Loan_Default_Risk_A_SAS_Enterprise_Miner_Approach.docx)  
📘 [Download User Training Manual (Word Doc)](Project-Files/User_Training_Manual_Loan_Default_Project.docx)  
📊 [Download SAS Process Flow Screenshots (PDF)](Project-Files/Loan_Default_SAS_Model_Screenshots.pdf)

## 📅 Completed
May 2025


## 📄 References
- Freshcorn, B. (2025). _Give me some credit: 2011 Competition data_ [Data set]. Kaggle. https://www.kaggle.com/datasets/brycecf/give-me-some-credit-dataset
- Zhu et al. (2023), Addy et al. (2024), McCarthy et al. (2022), and others. Full citations included in the report.


Add loan default project folder with README
