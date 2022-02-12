#1)
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))

aggregate(df1$Sales, by=list(df1$State), FUN=sum)

library(dplyr)

df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

# df1=data.frame is creating a data frame with the columns Name, State, and Sales, as well as
# filling each column with 12 things.

# aggregate(df1$Sales, by=list(df1$State), FUN=sum) is grouping all of the sales by state.
# FUN=sum is saying to use the function SUM to add all of the sales together

# library(dplyr) adds a library that contains summarise() in it

# df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales)) all of this displays the same data
# displayed above but with labeled columns

# =============================================================================================================

#2)
df2 = read.csv('D:/Users/Jeremy/Desktop/Online_Assignments/Winter 2022/CSC 302/WorldCupMatches.csv', header = T)

#(a)
dim(df2)

#(b)
summary(df2)

#(c)
unique(df2$City) #displays unique places
n_distinct(df2$City) #using dplyr to get the count of how many unique places

#(d)
mean(df2$Attendance, na.rm = TRUE)

#(e)
aggregate(df2$Home.Team.Goals, by=list(df2$Home.Team.Name), FUN=sum)

#(f)
aggregate(df2$Attendance, by=list(df2$Year), FUN=mean)

# =============================================================================================================

#3)
df3 = read.csv('D:/Users/Jeremy/Desktop/Online_Assignments/Winter 2022/CSC 302/metabolite.csv', header = T)

#(a)
df3 %>% group_by(Label) %>% count()

#(b)
colSums(is.na(df3))

#(c)
df4 = df3[is.na(df3['Dopamine'])==F, ]
head(df4)

#(d)
df4$c4.OH.Pro[is.na(df4$c4.OH.Pro)] <- median(df4$c4.OH.Pro, na.rm = TRUE)
head(df4)
