
##load libraries and functions
library(MASS) 
library(survival)
source("NRI_functions.R")

#set predict time
predict.time <- 3

#set tuning parameter bw.power
bw.power <- 0.35

##load in data
load("SimData_Example.Rdata")
head(SimData)

## Note: in order to work, the data must be in the form of a dataframe or matrix with columns: times, status, marker 1, marker 2, ....

#first calculate conditional probability P(T<t|Y) for each individual at predict.time = t based on a Cox model using 'PtfromCox'

#using markers y1 and y2
Pt2 <- PtfromCox(SimData, predict.time)
#using only marker y1
Pt1 <- PtfromCox(SimData[,-c(4)],predict.time)

##NRI using five different estimates, each function returns a vector of NRI | event, NRI | non-event, and NRI. 

##IPW
IPW <- NRI.smooth.IPW(times = SimData$stime, status = SimData$status, predict.time = predict.time, Pt2 = Pt2, Pt1 = Pt1, yes.smooth=FALSE)

##KM
KM <- NRI.KM(Pt2 = Pt2, Pt1 = Pt1, data = SimData, predict.time = predict.time)

##SEM
SEM <- NRI.SEM(Pt2 = Pt2,Pt1 = Pt1)

##Smooth IPW
#to get the smoothed IPW estimate, set yes.smooth=TRUE
SmoothIPW <- NRI.smooth.IPW(times = SimData$stime, status = SimData$status, predict.time = predict.time, Pt2 = Pt2, Pt1 = Pt1, yes.smooth=TRUE)

##Combined
##pvalue tests to calculate the combined estimate
pvalue.test <- coxph(Surv(stime, status)~y1+y2, data=SimData)
pvalue.test <- cox.zph(pvalue.test)$table
pvalue.test <- pvalue.test[length(pvalue.test)]

Combined <- SmoothIPW*(1-pvalue.test)+pvalue.test*SEM

#look at the results
IPW
KM
SEM
SmoothIPW
Combined

files <- list.files(path="survNRI/R", full.names=TRUE, pattern = "R$")
result <- do.call(rbind, lapply(files, source))
x


x<- survNRI( time  = "stime", event = "status", model1 = "y1", model2 = c("y1", "y2"), data = SimData, 
         predict.time = 2, method = c("SmoothIPW", "SEM", "Combined"), bootMethod = "percentile", bootstraps = 10)

survNRI( time  = "stime", event = "status", model1 = "y1", model2 = c("y1", "y2"), data = SimData, 
         predict.time = 2, method = "all", bootstraps = 100, alpha = .01)


x<- survNRI( time  = "stime", event = "status", model1 = "y1", model2 = c("y1", "y2"), data = SimData, 
         predict.time = 3, method = "all", bootMethod = "percentile", bootstraps = 10, alpha = .01)



