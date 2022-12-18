install.packages("tidyverse")
library(tidyverse)
install.packages("haven")
library(haven)
install.packages("dplyr")
library(dplyr)
install.packages("Hmisc")
library(Hmisc)
library(matrixStats)

#Log File Start
my_log <- file("log.txt")
sink(my_log, append = TRUE, type = "output")
sink(my_log, append = TRUE, type = "message")
cat(readChar(rstudioapi::getSourceEditorContext()$path,
             file.info(rstudioapi::getSourceEditorContext()$path)$size))

#Importing and Filtering Data
library(haven)
atlas <- read_dta("C:/Users/LENOVO/Downloads/atlas.dta")
state <- subset(atlas, state == "36")
state
New_York <- subset(atlas, czname == "New York")

#1 Mean of Upward Mobility in New York vs. Mean of Upward Mobility in State and Country (Weighted), 25th Percentile
mean(New_York$kfr_pooled_p25, na.rm=TRUE)
weighted.mean(state$kfr_pooled_p25, state$count_pooled)
weighted.mean(atlas$kfr_pooled_p25, atlas$count_pooled, na.rm=TRUE)
mean(atlas$kfr_pooled_p25, na.rm=TRUE)

#2 SD of Upward Mobility in New York(Weighted) vs. SD of Upward Mobility in State and Country(Weighted), 25th Percentile
sqrt(Hmisc::wtd.var(New_York$kfr_pooled_p25, New_York$count_pooled, na.rm=TRUE))
sqrt(Hmisc::wtd.var(state$kfr_pooled_p25, state$count_pooled, na.rm=TRUE))
sqrt(Hmisc::wtd.var(atlas$kfr_pooled_p25, atlas$count_pooled, na.rm=TRUE))

#3 Mean of Downward Mobility in New York vs. Mean of Downward Mobility in State and Country (Weighted), 75th Percentile
mean(New_York$kfr_pooled_p75, na.rm=TRUE)
weighted.mean(state$kfr_pooled_p75, state$count_pooled, na.rm=TRUE)
weighted.mean(atlas$kfr_pooled_p75, atlas$count_pooled, na.rm=TRUE)
mean(atlas$kfr_pooled_p75, na.rm=TRUE)

#4 SD of Downward Mobility in New York(Weighted) vs. SD of Downward Mobility in State and Country(Weighted), 75th Percentile
sqrt(Hmisc::wtd.var(New_York$kfr_pooled_p75, New_York$count_pooled, na.rm=TRUE))
sqrt(Hmisc::wtd.var(state$kfr_pooled_p75, state$count_pooled, na.rm=TRUE))
sqrt(Hmisc::wtd.var(atlas$kfr_pooled_p75, atlas$count_pooled, na.rm=TRUE))

#5 Mean of Downward Mobility in New York vs. Mean of Downward Mobility in State and Country (Weighted), 100th Percentile
mean(New_York$kfr_pooled_p100, na.rm=TRUE)
weighted.mean(state$kfr_pooled_p100, state$count_pooled, na.rm=TRUE)
weighted.mean(atlas$kfr_pooled_p100, atlas$count_pooled, na.rm=TRUE)
mean(atlas$kfr_pooled_p100, na.rm=TRUE)

#6 SD of Downward Mobility in New York(Weighted) vs. SD of Downward Mobility in State and Country(Weighted), 100th Percentile
sqrt(Hmisc::wtd.var(New_York$kfr_pooled_p100, New_York$count_pooled, na.rm=TRUE))
sqrt(Hmisc::wtd.var(state$kfr_pooled_p100, state$count_pooled, na.rm=TRUE))
sqrt(Hmisc::wtd.var(atlas$kfr_pooled_p100, atlas$count_pooled, na.rm=TRUE))

#7 Linear Regression Analysis of the Outcomes of Children, 25th Percentile
x <- New_York$count_pooled
y <- New_York$kfr_pooled_p25
relation.25 <- lm(y~x)
plot(y,x,col = "blue",main = "Regression Analysis of Household Income and Population at the 25th Percentile",
abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Population of Children",ylab = "Household Income at 35 Years of Age")

#8 Linear Regression Analysis of the Outcomes of Children, 75th Percentile
x.1 <- New_York$count_pooled
y.1 <- New_York$kfr_pooled_p75
relation.75 <- lm(y.1~x.1)
plot(y.1,x.1,col = "green",main = "Regression Analysis of Household Income and Population at the 75th Percentile",
abline(lm(x.1~y.1)),cex = 1.3,pch = 16,xlab = "Population of Children",ylab = "Household Income at 35 Years of Age")

#9 Linear Regression Analysis of the Outcomes of Children, White, 25th Percentile
New_York$count_white
New_York$kfr_white_p25
plot(New_York$kfr_white_p25,dallas$count_white, col = "blue",main = "Regression Analysis of Household Income and Population at the 25th Percentile; White",
abline(lm(New_York$count_white~dallas$kfr_white_p25)),cex = 1.3,pch = 16,xlab = "Population of Children",ylab = "Household Income at 35 Years of Age")

#10 Linear Regression Analysis of the Outcomes of Children, Black, 25th Percentile
New_York$count_black
New_York$kfr_black_p25
plot(New_York$kfr_black_p25,New_York$count_black, col = "blue",main = "Regression Analysis of Household Income and Population at the 25th Percentile; Black",
abline(lm(New_York$count_black~dallas$kfr_black_p25)),cex = 1.3,pch = 16,xlab = "Population of Children",ylab = "Household Income at 35 Years of Age")

#11 Linear Regression Analysis of the Outcomes of Children, White, 75th Percentile
New_York$count_white
New_York$kfr_white_p75
plot(New_York$kfr_white_p75,dallas$count_white, col = "red",main = "Regression Analysis of Household Income and Population at the 75th Percentile; White",
abline(lm(New_York$count_white~dallas$kfr_white_p75)),cex = 1.3,pch = 16,xlab = "Population of Children",ylab = "Household Income at 35 Years of Age")

#12 Linear Regression Analysis of the Outcomes of Children, Black, 75th Percentile
New_York$count_black
New_York$kfr_black_p75
plot(New_York$kfr_black_p75,dallas$count_black, col = "red",main = "Regression Analysis of Household Income and Population at the 75th Percentile; Black",
abline(lm(New_York$count_black~dallas$kfr_black_p75)),cex = 1.3,pch = 16,xlab = "Population of Children",ylab = "Household Income at 35 Years of Age")

#13 Correlation Coefficient between Education Rates (College Degree, 2010) and Household Income at 25th Percentile
cor.test(New_York$frac_coll_plus2010, New_York$kfr_pooled_p25)

#14 Correlation Coefficient between Education Rates (College Degree, 2010) and Household Income at 75th Percentile
cor.test(New_York$frac_coll_plus2010, New_York$kfr_pooled_p75)

#15 Correlation Coefficient between Rent and Household Income at 25th Percentile
cor.test(New_York$rent_twobed2015, New_York$kfr_pooled_p25)

#16 Correlation Coefficient between Rent and Household Income at 75th Percentile
cor.test(New_York$rent_twobed2015, New_York$kfr_pooled_p75)

#Log File End
closeAllConnections()