box<-9
class(box) #class shows the class of something, e.g. numeric og character
name<-"Peter"
class(name)
a_vector<-c(2,3,4)
a_vector+3
cats<-c(2,3,4)
group1<-c(cats,a_vector)
a_vector[1]
a_vector[1]
#Riscool 
length(a_vector)
a_new_vector<-a_vector*3
a_new_vector
class(a_new_vector)
a_new_vector[-1]
a_new_vector[-c(1,2)]
rm(box) #rm er en funktion der fjerne noget fra the environment. 
#if you do something permanent to a variable, you have to give it a new name. Because if you just do something, it will show the result, but won't remember it. 
sum(a_new_vector)

#Exercise 1
names_vector<-c("Amanda","Maria","Anna","Gustav","Helle")
number_siblings <- c(1,2,0,3,3)
names_vector+2
number_siblings+2
#you cannot add 2 to the names one because it is not numerical values, but you can to the number of siblings
class(names_vector)
class(number_siblings)
#character and numeric
sum(number_siblings)
#9
sum(number_siblings[1],number_siblings[2])
#3
name <- Peter
#It's an error because the name is not in qoutation marks 

#Execise 2
Siblinframe <- data.frame(names_vector,number_siblings)
gender <- c("female","female","female","male","female")
siblingframe <- data.frame(Siblinframe,gender)
#a quicker way is to use: siblingframe$gender <- c("female","female","female","male","female")
siblingframe

#new column: dataframe$new_column<-c(new data)
#new row: dataframe<-rbind(dataframe, c(new row))
#if you encouter problems use as.character, as.numeric etc. 

siblingframe$names_vector <- as.character(siblingframe$names_vector)
rbind(siblingframe,c("Fabio",4,"male"))
siblingframe1 <- data.frame(names_vector,number_siblings,gender)
siblingframe1
siblingframe1$names_vector <- as.character(siblingframe1$names_vector)
siblingfabio <- rbind(siblingframe1,c("Fabio",4,"male"))

#Mean number of siblings
mean(number_siblings)
#1.8 siblings

#Here I add a new column called real_siblings, which is the real number of siblings people had. 
real_siblings <- siblingfabio$real_siblings <- c(4,1,0,3,3,1)
#Then im checking that it looks correct. 
siblingfabio
#Here I tried to create siblings_off in a clever way but didn't succeed. 
siblingfabio$siblingsOff <- siblingfabio$number_siblings - siblingfabio$real_siblings
#So I made this calculation first. 
siblings_off <- as.numeric(number_siblings - real_siblings)

#Then I could create the new column
siblings_off <- siblingfabio$siblings_off <- siblings_off
#and check that it worked, which it did. Yay. 
siblingfabio


#Exercise 3
subset(siblingfabio,real_siblings==3)
#Gustav and Helle have three siblings. 
subset(siblingfabio,real_siblings>2)
#Amanda, Gustav and Helle have more than two siblings. 
subset(siblingfabio,siblings_off==0)
#I guessed Anna, Gustav Helle and Fabio correctly. 

?round()
?length()
?unique
?mean
