# Credit Card Spend Modeling & Revenue Driver Analysis

## Project Summary

This project evaluates multiple regression model specifications to predict annual credit card charges using a real-world dataset of 5,000 customers.

The objective was not only to build a predictive model, but to systematically analyze:
- Model specification impact
- Non-linearity effects
- Interaction effects
- Assumption diagnostics
- Out-of-sample generalization performance

The project emphasizes statistical rigor, interpretability, and validation.

---

## Dataset

- 5,000 customer observations
- 3,000 training samples
- 2,000 test samples
- Target variable: `charges` (annual credit card spending)

### Features
- `income`
- `size`
- `education`
- `tv`
- `age`
- `gender`
- `limit` (credit limit exceeded indicator)

Data was randomly split using a fixed seed to ensure reproducibility.

---

## Modeling Framework

### Model 1 — Baseline Linear Regression

charges ~ income + size + education + tv + age + gender + limit

- Multiple R² = 0.371
- Adjusted R² = 0.3696
- F-statistic p-value < 2e-16

**Significant predictors (α = 0.05):**
- Income (+)
- Household Size (+)
- Education (−)

Interpretation:
Income shows a strong positive marginal effect on charges.
Education exhibits a negative association, potentially reflecting behavioral spending differences.

---

### Model 2 — Log-Linear Specification

log(charges) ~ predictors

Purpose:
- Address heteroskedasticity
- Improve residual variance stability

R² ≈ 0.207

Log transformation improved error structure but reduced explanatory power relative to the linear model.

---

### Model 3 — Nonlinear Extension

Added polynomial terms:

- I(age²)
- I(income²)

Income² statistically significant → indicates diminishing marginal returns of income on spending.

This specification captures nonlinear spending elasticity.

---

### Model 4 — Interaction Model

Added interaction terms:

- income × gender
- income × limit

Interaction terms were not statistically significant and did not materially improve generalization performance.

This reinforces the principle of parsimony in model selection.

---

## Model Diagnostics

For each model:

- Residual vs Fitted plots (linearity assessment)
- Q-Q plots (normality of residuals)
- Scale-location plots (variance homogeneity)
- Leverage diagnostics (influential observations)

Log-transformed models improved heteroskedasticity patterns.

No severe multicollinearity observed.

---

## Out-of-Sample Validation

Models were evaluated using test-set Mean Squared Error (MSE).

Baseline Linear Model:
- RMSE ≈ $4,860

More complex models (nonlinear and interaction) did not significantly outperform the simpler baseline model on unseen data.

This demonstrates:

- Over-parameterization risk
- Bias-variance tradeoff in practice
- Importance of generalization over in-sample fit

---

## Key Technical Insights

- Income is the dominant predictor of credit charges.
- Household size increases spending magnitude.
- Education negatively correlates with annual spending.
- Nonlinear income effects are statistically significant but economically modest.
- Model complexity increases interpretability cost without predictive gain.

---

## Technical Stack

- R
- Linear Modeling (`lm`)
- Polynomial Feature Engineering
- Interaction Modeling
- Residual Diagnostics
- Train/Test Split Validation
- Model Comparison via MSE

---

## Practical Implications

This modeling framework can support:

- Revenue forecasting
- Credit risk segmentation
- Customer-level spending prediction
- Portfolio-level revenue estimation
- Policy optimization under interpretability constraints

---

## Repository Structure

credit.csv  
analysis.R  
README.md  

---

## Author
Nida Muhammad Umer  
Data Analyst | Statistical Modeling | Predictive Analytics | Regression | Statistical Modeling | Financial Analytics | Predictive Modeling
