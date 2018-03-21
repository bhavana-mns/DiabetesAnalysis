library(mice)
library(VIM)
library(readxl)
library(missForest)
#meal <- read_csv("C:/Bhavana/Profesional/Sem5/BD/CCBD/meal 21.csv")
meal <- read_excel("C:/Bhavana/Profesional/Sem5/BD/CCBD/DataCSV/meal68Miss.xlsx")
meal.mis <- prodNA(meal, noNA = 0.1)
meal.mis <- subset(meal.mis, select = -c(Date))
meal.mis <- subset(meal.mis, select = -c(`time-b&l`))
meal.mis <- subset(meal.mis, select = -c(`time-l&s`))

mice_plot <- aggr(meal.mis, col=c('navyblue','yellow'),
                  numbers=TRUE, sortVars=FALSE,
                  labels=names(meal.mis), cex.axis=.7,
                  gap=3, ylab=c("Missing data","Pattern"))
imputed_Data <- mice(meal.mis, m=5, maxit = 50, method = 'pmm', seed = 500)
completeData <- complete(imputed_Data,2)