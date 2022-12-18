library(tidyverse)
library(haven)
library(dplyr)
library(Hmisc)
library(matrixStats)
library(ggplot2)
install.packages("broom")
install.packages("ggpubr")
library(ggplot2)
library(broom)
library(ggpubr)
library(rpart)
library(randomForest)
library(caret)

#Reading in csv export file Q2
datacommons_data <- read.csv("C:/Users/vedak/Downloads/ISL R-Studio/datacommons_data.csv")

#Reading in atlas_training.dta Q2
atlas_data <- read_dta("C:/Users/vedak/Downloads/ISL R-Studio/atlas_training.dta")

#Cleaning up datacommons_data for merging Q3
datacommons_data$placeDcid <- gsub('geoId/', '', datacommons_data$placeDcid) 
view(datacommons_data)
colnames(datacommons_data) <- gsub('placeDcid', 'geoid', colnames(datacommons_data))
view(datacommons_data)

#Merging atlas_training and datacommons_data Q3
data <- merge(datacommons_data, atlas_data, by = "geoid")
view(data) 

#converting variables into rates - DO NOT RUN THESE MORE THAN ONCE Q4
data$Count_Person_BelowPovertyLevelInThePast12Months <- data$Count_Person_BelowPovertyLevelInThePast12Months/data$pop

data$Count_CriminalActivities_CombinedCrime <- data$Count_CriminalActivities_CombinedCrime/data $pop
data$Count_HousingUnit <- data$Count_HousingUnit/data$pop

data$Count_Person_Civilian_USDollarUpto25000_ResidesInHousehold <- data$Count_Person_Civilian_USDollarUpto25000_ResidesInHousehold/data$pop

data$Count_Person_EducationalAttainmentRegularHighSchoolDiploma <- data$Count_Person_EducationalAttainmentRegularHighSchoolDiploma/data$pop
data$Count_Person_NativeBornOutsideTheUnitedStates <- data$Count_Person_NativeBornOutsideTheUnitedStates/data$pop

data$Count_Person_PerArea <- data$Count_Person_PerArea/data$pop
view(data)

#summary statistics Q5
summary(data$Person_BelowPovertyLevelInThePast12Months)
summary(data$LifeExpectancy_Person)
summary(data$Median_Income_Person)
summary(data$UnemploymentRate_Person)
summary(data$Count_CriminalActivities_CombinedCrime)
summary(data$Count_Person_EducationalAttainmentRegularHighSchoolDiploma)
summary(data$Count_HousingUnit)
summary(data$Count_Person_Civilian_USDollarUpto25000_ResidesInHousehold)
summary(data$Count_Person_PerArea)
summary(data$Count_Person_NativeBornOutsideTheUnitedStates)
summary(data$kfr_pooled_p25)
view(data)

#Linear regression Q6
lmod <- lm(UnemploymentRate_Person ~ kfr_pooled_p25, data)
summary(lmod)

lmod <- lm(Count_Person_BelowPovertyLevelInThePast12Months ~ kfr_pooled_p25, data)
summary(lmod)

lmod <- lm(Median_Income_Person ~ kfr_pooled_p25, data)
summary(lmod)

lmod <- lm(Count_Person_EducationalAttainmentRegularHighSchoolDiploma ~ kfr_pooled_p25, data)
summary(lmod)

lmod <- lm(Count_HousingUnit ~ kfr_pooled_p25, data)
summary(lmod)

lmod <- lm(data$Count_Person_Civilian_USDollarUpto25000_ResidesInHousehold ~ kfr_pooled_p25, data)
summary(lmod)

lmod <- lm(data$Count_Person_NativeBornOutsideTheUnitedStates ~ kfr_pooled_p25, data)
summary(lmod)

#Linear regression of the full predictor set Q8
vars <- colnames(data[19:ncol(data)])
mod1 <- with(data[data$training==1,],lm(formula=reformulate(vars, "kfr_pooled_p25")))
summary(mod1)

#decision tree Q9
tree <- rpart(reformulate(vars, "kfr_pooled_p25"), data= data, 
              subset= training==1,    control=rpart.control(xval=10))
plot(tree)
text(tree)

#Random Forest with 1000 Bootstraps Q11
#random forest
rf <- randomForest(reformulate(vars, "kfr_pooled_p25"), data = data[data$training==1,], 
                   mtry=11, ntree = 1000, importance=TRUE, do.trace=25, na.action=na.omit)
getTree(forest_hat,250, labelvar=TRUE)

#mean squared error Q12

mean(mod1$residuals^2)
mean(tree$residuals^2)
mean(rf$residuals^2)

#step 14

sum(mod1$residuals^2)/mod1$df.residual
sum(tree$residuals^2)/tree$df.residual
sum(rf$residuals^2)/rf$df.residual

library(log4r)
library(logr)
