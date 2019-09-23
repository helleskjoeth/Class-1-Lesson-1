getwd()
library(ggplot2)
library(Rcmdr)
facebookData <- read.delim("FacebookNarcissism.dat", header = TRUE)
graph <- ggplot(facebookData, aes(NPQC_R_Total, Rating))
graph+geom_point()
graph+geom_point(shape=17)
graph+geom_point(size = 6)
graph+geom_point(aes(colour = Rating_Type))
graph+geom_point(aes(colour = Rating_Type), position = "jitter")
graph+geom_point(aes(shape = Rating_Type), position = "jitter")

examData <- read.delim("Exam Anxiety.dat", header=TRUE)
scatter <- ggplot(examData, aes(Anxiety, Exam))
scatter + geom_point()
scatter + geom_point() + labs(x = "Exam Anxiety", y = "Exam Performance %")
scatter + geom_point() + geom_smooth() + labs(x = "Exam Anxiety", y = "Exam Performance %")
scatter + geom_point() + geom_smooth(method = "lm") + labs(x = "Exam Anxiety", y = "Exam Performance %")
scatter + geom_point() + geom_smooth(method = "lm", colour = "Red") + labs(x = "Exam Anxiety", y = "Exam Performance %")
scatter + geom_point() + geom_smooth(method = "lm", colour = "Red", se = F) + labs(x = "Exam Anxiety", y = "Exam Performance %")
scatter + geom_point() + geom_smooth(method = "lm", colour = "Red", alpha = 0.1, fill="Red") + labs(x = "Exam Anxiety", y = "Exam Performance %")
scatter <- ggplot(examData, aes(Anxiety, Exam, colour = Gender))
scatter + geom_point() + geom_smooth(method = "lm")
scatter + geom_point() + geom_smooth(method = "lm", aes(fill = Gender), alpha = 0.1)
scatter + geom_point() + geom_smooth(method = "lm", aes(fill = Gender), alpha = 0.1) + labs(x = "Exam Anxiety", y = "Exam Performance %", colour = "Gender")

graph <- ggplot(facebookData, aes(NPQC_R_Total, Rating_Type))                  
graph+geom_line()
graph+geom_line(aes(colour = Rating_Type))
graph+geom_line(aes(colour = Rating_Type))+ geom_point()
graph+geom_line(aes(colour = Rating_Type))+ geom_point()+ labs(X = "Narcissism", y = "Rating Type")

View(festivalData)
festivalData <- read.delim("DownloadFestival.dat", header = T)
festivalHistogram <- ggplot(festivalData, aes(day1))                 
festivalHistogram + geom_histogram()
festivalHistogram + geom_histogram(binwidth=0.4)
festivalHistogram + geom_histogram(binwidth=0.4) + labs(x = "Hygeine (Day 1 of Festival)", y = "Frequency")

festivalBoxplot <- ggplot(festivalData, aes(gender, day1))
festivalBoxplot+geom_boxplot() + labs(x = "Gender", y = "Hygeine (Day 1 of Festival)")

festivalData <- festivalData[order(festivalData$day1),]
festivalBoxplot+geom_boxplot() + labs(x = "Gender", y = "Hygeine (Day 1 of Festival)")

festivalBoxplot2 <- ggplot(festivalData, aes(gender, day2))
festivalBoxplot2+geom_boxplot() + labs(x = "Gender", y = "Hygeine (Day 2 of Festival)")

festivalBoxplot3 <- ggplot(festivalData, aes(gender, day3))
festivalBoxplot3+geom_boxplot() + labs(x = "Gender", y = "Hygeine (Day 3 of Festival)")

density <- ggplot(festivalData, aes(day1))
density + geom_density()
density + geom_density() + labs(x ="Hygeine (Day 1 of Festival)", y = "Density Estimate")


chickFlick <- read.delim("ChickFlick.dat", header = T)
bar <- ggplot(chickFlick, aes(film, arousal))
bar+ stat_summary(fun.y = mean, geom = "bar", fill = "pink", colour = "Black")
bar+ stat_summary(fun.y = mean, geom = "bar", fill = "pink", colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange")
bar+ stat_summary(fun.y = mean, geom = "bar", fill = "pink", colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange") + labs(x= "Film", y = "Mean arousal")

bar+ stat_summary(fun.y = mean, geom = "bar", fill = "pink", colour = "Black") + geom_errorbar(stat = "summary", colour = "Red")  + labs(x= "Film", y = "Mean arousal")
bar+ stat_summary(fun.y = mean, geom = "bar", fill = "pink", colour = "Black") + geom_errorbar(stat = "summary", colour = "Red")  + labs(x= "Film", y = "Mean arousal") + stat_summary(fun.data = mean_cl_boot, geom = "pointrange")

bar <- ggplot(chickFlick, aes(film, arousal, fill = gender))
bar + stat_summary(fun.y = mean, geom = "bar", position = "dodge")
bar + stat_summary(fun.y = mean, geom = "bar", position = "dodge") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", position = position_dodge(width=0.90), width=0.2)
bar + stat_summary(fun.y = mean, geom = "bar", position = "dodge") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", position = position_dodge(width=0.90), width=0.2)+labs(x="Film", y = "Mean Arousal", fill = "Gender")

bar <- ggplot(chickFlick, aes(film, arousal, fill = film))
bar + stat_summary(fun.y = mean, geom = "bar")                                                                                  
bar + stat_summary(fun.y = mean, geom = "bar")+ stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2)
bar + stat_summary(fun.y = mean, geom = "bar")+ stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2) + facet_wrap(~ gender)+labs(x = "Film", y = "Mean Arousal")
bar + stat_summary(fun.y = mean, geom = "bar")+ stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2) + facet_wrap(~ gender)+labs(x = "Film", y = "Mean Arousal")+ scale_fill_manual ("Gender", c("Female" = "Blue", "Male" = "Green"))

hiccupsData <- read.delim("Hiccups.dat", header = T)
hiccups <- stack(hiccupsData)
names(hiccups) <- c("Hiccups", "Intervention")
line <- ggplot(hiccups, aes(Intervention, Hiccups))
line+ stat_summary(fun.y = mean, geom = "point")
line+ stat_summary(fun.y = mean, geom = "line", aes(group = 1))
line+ stat_summary(fun.y = mean, geom = "line", aes(group = 1), colour = "Blue", linetype = "dashed")
line+ stat_summary(fun.y = mean, geom = "line", aes(group = 1), colour = "Blue", linetype = "dashed") + stat_summary(fyn.data = mean_cl_boot, geom = "errorbar", width = 0.2)
line+ stat_summary(fun.y = mean, geom = "line", aes(group = 1), colour = "Blue", linetype = "dashed") + stat_summary(fyn.data = mean_cl_boot, geom = "errorbar", width = 0.2)+ labs(x = "Intervention", y = "Mean Number of Hiccups")


textData <- read.delim("TextMessages.dat", header = T)
rm(textMessages)
textMessages <- stack(textData)
Time <- c(rep(1:50), rep(51:100))
Time <- factor(Time, levels = c(1:100), labels = c("Baseline", "6 Months"))
#HEEEEEEEEEEEEEEEEEEEEEEEELP page 159









