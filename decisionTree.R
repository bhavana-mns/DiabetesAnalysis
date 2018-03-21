library(readxl)
library(rpart)
library(ggplot2)
library(reshape2)
library(plyr)
library(dplyr)
library(caret)
library(scales)
library(GGally)
library(rpart.plot)
library(SDMTools)
meal68 <- read_excel("C:/Bhavana/Profesional/Sem5/BD/CCBD/DataCSV/meal68.xlsx")
#View(meal68)
meal68 <- subset(meal68, select = -c(Date))

train_idx <- sample.int(n = nrow(meal68), size = floor(.90*nrow(df)), replace = T)
train <- meal68[train_idx, ]
test <- meal68[-train_idx, ]
test_labels <- test[, 1]

rtree <- rpart(`pre breakfast` ~ ., data = meal68, method = 'class')
plot(rtree)
text(rtree, pretty = 0)

out <- predict(rpart)
pred.r <- colnames(out)[max.col(out, ties.method = c("random"))] # predict response
mean(meal68$`pre breakfast` != pred.r) #Misclassification Error = 0.84
#Pred <- predict(rtree, train, type = 'class')
#table(Pred,train$`pre breakfast`)

#confMat <- table(test,Pred)

#test_sample <- sample_n(train, 10, replace=TRUE)
#test_predictions <- predict(rtree, test, "raw")
#actual1 <- round(`pre breakfast`, 0)
#predicted <- round(test_predictions, 0)
#data.frame(actual=actual1, 
#predicted=predicted, 
#difference=actual1-predicted)