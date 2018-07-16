---
title: "Linear regression Project"
author: "Mugilan"
date: "21 May 2018"
---
  
#Setting working directory & Reading the files to the environment
setwd("C:/Users/10891/Downloads/Mukil/Besant")

#importing data
data <- read.csv("Simple_linear.csv",header = T)

#looking the structure of data
str(data)

#Looking for NA values
sum(is.na(data))

#Since no NA values, I'm directly building model on the data
linearmodel<-lm(data$Age~.,data)
summary(linearmodel)

#Predicting on the train Data
Train_prediction<-predict(object = linearmodel)

#For better understanding, I'm comparing the result with actual data
comparison = cbind(Actual = data$Age,Predictions = Train_prediction)
View(comparison)


#Evaluating the predictions - RMSE
library(MLmetrics)
RMSE(y_pred = Train_prediction,y_true = data$Age)

#Evaluating the predictions - MAPE
MAPE(y_pred = Train_prediction,y_true = data$Age)


#data the we discussed
x = c(100,150,200,250,300)
y = c(11,12,13,14,15)
data1 = as.data.frame(cbind(x,y))

#Creating a Linear line for better understanding.
with(data1,plot(x, y))+
abline(lm(y~.,data1))
