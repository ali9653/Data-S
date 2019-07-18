# Bank Credit Card Default Prediction


#1)Read data from excel

dflr=read.csv(file.choose())
dflr


#2)Data cleaning

str(dflr)
summary(dflr)

dflr$Customer.ID=NULL
dflr$Gender=as.factor(dflr$Gender)
dflr$Marital=as.factor(dflr$Marital)
dflr$Academic_Qualification=as.factor(dflr$Academic_Qualification)
dflr$Default_Payment=as.factor(dflr$Default_Payment)
dflr$Repayment_Status_Jan=as.factor(dflr$Repayment_Status_Jan)
dflr$Repayment_Status_Feb=as.factor(dflr$Repayment_Status_Feb)
dflr$Repayment_Status_March=as.factor(dflr$Repayment_Status_March)
dflr$Repayment_Status_April=as.factor(dflr$Repayment_Status_April)
dflr$Repayment_Status_May=as.factor(dflr$Repayment_Status_May)
dflr$Repayment_Status_June=as.factor(dflr$Repayment_Status_June)

dflr

#since we want to predict defaulters i.e =1 we have to change the Default_Payment levels to "1" and "0"
#$ Default_Payment       : Factor w/ 2 levels "0","1": 2 2 1 1 1 1 1 1 1 1 ...

dflr$Default_Payment=factor(dflr$Default_Payment,levels = c('1','0'))
str(dflr)


#3)Data visalization

#histogram

dev.new()
par(mfrow=c(3,2))
hist(dflr$Previous_Payment_Jan,main = "January",col = 'black',border = 'red')
hist(dflr$Previous_Payment_Feb,main = "February",col = 'black',border = 'red')
hist(dflr$Previous_Payment_March,main = "March",col = 'black',border = 'red')
hist(dflr$Previous_Payment_April,main = "April",col = 'black',border = 'red')
hist(dflr$Previous_Payment_May,main = "May",col = 'black',border = 'red')
hist(dflr$Previous_Payment_June,main = "June",col = 'black',border = 'red')


#boxplot    syntax == (numeric~factor)  always

dev.new()
boxplot(dflr$Credit_Amount~dflr$Default_Payment,col='black',border='blue')

dev.new()
boxplot(dflr$Credit_Amount~dflr$Repayment_Status_Jan,col='black',border='blue')

#scatter plot for relationship (x and y both should be numeric)
#ggplot

library(ggplot2)

gg1=ggplot(dflr,aes(x=dflr$Age_Years,y=dflr$Credit_Amount,col=dflr$Default_Payment))
dev.new()
gg1+geom_point()

table(dflr$Default_Payment)



























