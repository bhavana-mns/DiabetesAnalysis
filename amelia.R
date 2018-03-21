library(Amelia)
library(mice)
library(VIM)
library(readr)
library(missForest)
meal <- read_csv("C:/Bhavana/Profesional/Sem5/BD/CCBD/meal 21.csv")

meal.mis <- prodNA(meal, noNA = 0.1)
meal.mis <- subset(meal.mis, select = -c(`pre lun insulin`))
meal.mis <- subset(meal.mis, select = -c(Date))
amelia_fit <- amelia(meal.mis, m=5, parallel = "multicore") #Not working