# social_mobility_NYC_figures
In this project, 10 variables were employed to analyze the upward mobility of a neighborhood in NYC. 

The 10 county-level variables the group chose to analyze are the following:  
1.	Life expectancy
2.	Median income
3.	Count of people below poverty level in the past 12 months
4.	Unemployment rate
5.	Combined crime criminal activities count
6.	Count of educational attainment of regular high school diploma 
7.	Count of housing units
8.	Count of civilians in household with USD up to $25000
9.	Count of people per area
10.	Count of native people born outside the US

After the data files were downloaded and merged, the count predictors were converted to rates. Then, linear regression was run on six predictors. Four of the predictors- life expectancy, combined crime criminal activities count, count of people per area, and count of people below poverty level in the past 12 months- showed NA values when linear regression was done.

Each individual county of the dataset was distinguished through population and a county specific value was utilized in combining data sets. Population sizes of each county range from 10,093 people to 9,893,481 with the average population of the data set consisting of 240,926 people. The mean count of attainment of a regular high school diploma consisted of 17.7% of the population and 14.5% of the population in the first quartile while 21.1% in the third quartile. Mean income values include $27,304 and first quartile values $23,432 while income values at the third quartile are $30,756. Gender income equalities at the mean rate are 22.8% compared with first quartile rates of 18.8% and 26.75% at the third quartile. A much larger percentage of households possess internet access as an average of 64.6% of households do possess internet access compared to an average of 3.0% of households not possessing access to internet. Unemployment rates are at low rates of a mean unemployment rate of 1.5*10^-2%. From population data, an average of 23.7% of county populations are enrolled in school. The average of the mean national income at the 25th percentile consists of 0.408.

After running a linear regression on the dataset, values found to have statistically significant results in terms of upward mobility of the 25th percentile consisted of population size, attainment of a high school diploma, internet subscription and enrollment in school. Median income of a household was slightly significant in contributing to the upward mobility of the 25th percentile. The data indicates that access to education and the internet are key components of success. A final p-value of 1.303e-13 for the entire regression indicates the data is statistically significant and a low residual standard error demonstrates the data set predicts kfr_pooled_p25 values well.

Running a linear regression model on the full predictor set gave a long list of coefficients. The coefficient with count of households with internet subscriptions was 2.707e-01. This positive coefficient indicates that as the predictor variable increases, the response variable also increases. Interpreting this meaning, we see that a change by about a factor of 2.707e-01 of households with internet leads to a mean increase in one unit of ranking at the 25th percentile (kfr_pooled_p25).


