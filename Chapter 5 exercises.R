#Chapter 5 exercises 
library(ggplot2)
library(car)
library(pastecs)
library(psych)
festivalData <- read.delim("DownloadFestival(No Outlier).dat", header = T)
festivalHistogram1 <- ggplot(festivalData, aes(day1))+ geom_histogram(aes(y = ..density..), colour = "black", fill = "white", binwidth = 0.4)+ labs(x = "Hygiene score on day 1",y="Density")
festivalHistogram1
festivalHistogram2 <- ggplot(festivalData, aes(day3))+ geom_histogram(aes(y = ..density..), colour = "black", fill = "white", binwidth = 0.4)+ labs(x = "Hygiene score on day 2",y="Density")
festivalHistogram2
festivalHistogram3 <- ggplot(festivalData, aes(day3))+ geom_histogram(aes(y = ..density..), colour = "black", fill = "white", binwidth = 0.4)+ labs(x = "Hygiene score on day 3",y="Density")
festivalHistogram3

hist.day1 <- festivalHistogram1 + stat_function(fun = dnorm, args = list(mean = mean(festivalData$day1, na.rm = TRUE), sd = sd(festivalData$day1, na.rm = TRUE)), colour = "black", size = 1)
hist.day1
#removing missing values: na.rm = TRUE

hist.day2 <- festivalHistogram2 + stat_function(fun = dnorm, args = list(mean = mean(festivalData$day2, na.rm = TRUE), sd = sd(festivalData$day2, na.rm = TRUE)), colour = "black", size = 1)
hist.day2
hist.day3 <- festivalHistogram3 + stat_function(fun=dnorm, args=list(mean = mean(festivalData$day3 , na.rm = TRUE), sd = sd(festivalData$day3, na.rm = T)), colour = "black", size = 1)
hist.day3

qqplot.day1 <- qplot(sample= festivalData$day1, stat = "qq")
qqplot.day1
qqplot.day2 <- qplot(sample=festivalData$day2, stat="qq")
qqplot.day2
qqplot.day3 <- qplot(sample=festivalData$day3,stat = "qq")
qqplot.day3

