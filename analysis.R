credit=read.csv(file.choose())
attach(credit)  
str(credit)
head(credit)
dim(credit)
set.seed(25190)
train <- sample(1:nrow(credit), size = 3000)
training_data <- credit[train, ]
dim(training_data)
test_data <- credit[-train, ]
dim(test_data)

# Training Data
charges <- training_data$charges

# Descriptive Statistics:
# Mean:
summary(charges) #3. It also includes quartiles
# Standard Deviation:
sd(charges)
# Box Plot
boxplot(charges, main="Boxplot of charges")
income <- training_data$income
size <- training_data$size
education <- training_data$education
tv <- training_data$tv
age <- training_data$age

# Descriptive statistics of quantitative variables
summary(income)
summary(size)
summary(education)
summary(tv)
summary(age)
sd(income)
sd(size)
sd(education)
sd(tv)
sd(age)

# Box plot of quantitative variables
boxplot(income, main="Boxplot of income")
boxplot(size, main="Boxplot of size")
boxplot(education, main="Boxplot of education")
boxplot(tv, main="Boxplot of tv")
boxplot(age, main="Boxplot of age")

# Scattered plot:
plot(income, charges, main="Scatterplot of Charges vs. Income", 
     xlab = "Income", ylab = "Charges")
plot(size, charges, main="Scatterplot of Charges vs. Size", 
     xlab = "Size", ylab = "Charges")
plot(education, charges, main="Scatterplot of Charges vs. Education", 
     xlab = "Education", ylab = "Charges")
plot(tv, charges, main="Scatterplot of Charges vs. Tv", 
     xlab = "Tv", ylab = "Charges")
plot(age, charges, main="Scatterplot of Charges vs. Age", 
     xlab = "Age", ylab = "Charges")

# Matrix plot:
training_data$age <- as.numeric(age)
training_data$gender <- ifelse(training_data$gender == "Female", 0, 1)
training_data$limit <- ifelse(training_data$limit == "No", 0, 1)
str(training_data)
pairs(training_data, main = "Matrix Plot of All Variables",cex.labels = 1.5)

# Model 1:
model_1 <- lm(charges ~ income+size+education+tv+age+gender+limit, data = training_data) 
summary(model_1)
plot(model_1)
predict(model_1, data.frame(income=90, size=6, education=4, tv=45, age=50,
                            gender=1, limit=0),interval="prediction")

training_data$charges <- ifelse(charges == 0, NA, log(charges))
# Model 2:
Model_2 <- lm(log(training_data$charges) ~ income+size+education+tv+age+gender+limit, 
              data = training_data) 
summary(Model_2)
plot(Model_2)  
# Model 3:
Model_3 <- lm(log(training_data$charges) ~ income+size+education+tv+age+gender+limit
              +I(age^2)+I(income^2), data = training_data) 
summary(Model_3)
plot(Model_3)
# Model 4:
Model_4 <- lm(log(training_data$charges) ~ income+size+education+tv+age+gender+limit
              +I(age^2)+I(income^2)+gender:income+limit:income, data = training_data) 
summary(Model_4)
plot(Model_4)

test_data$gender <- ifelse(test_data$gender == "Female", 0, 1)
test_data$limit <- ifelse(test_data$limit == "No", 0, 1)
charges_hat1 <-predict(model_1, test_data)
charges_hat2 <-predict(Model_2, test_data)
charges_hat3 <-predict(Model_3, test_data)
charges_hat4 <-predict(Model_4, test_data)
MSE_1 <- mean((test_data$charges - charges_hat1)^2)
MSE_2 <- mean((test_data$charges - charges_hat2)^2)
MSE_3 <- mean((test_data$charges - charges_hat3)^2)
MSE_4 <- mean((test_data$charges - charges_hat4)^2)
print(MSE_1) 
print(MSE_2) 
print(MSE_3) 
