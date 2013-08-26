survNRI
============================

This package contains a single function `survNRI` which calculates the NRI for survival data using up to five different estimators. The different methods available are:

- *KM* = Kaplan- Meier estimator 
- *IPW* = Inverse probability weighted estimator 
- *SmoothIPW* = Smooth inverse probability weighted estimator 
- *SEM* = Semi-parametric estimator
- *Combined*= Combined estimator as described (along with all other estimates) in the reference paper:

*Lifetime Data Analysis* 2012 Dec 20. [Epub ahead of print] Evaluating incremental values from new predictors with net reclassification improvement in survival analysis. Zheng Y, Parast L, Cai T, Brown M. PMID: 23254468



```r
library(survNRI)
```

```
## Loading required package: MASS Loading required package: survival Loading
## required package: splines
```

```r
# some simulated data for example.
data(SimData)

# take a look
head(SimData)
```

```
##     stime status      y1      y2
## 1  3.9739      1  0.6942 -1.3600
## 2  4.2777      0 -1.8042 -0.4032
## 3  6.3922      0 -0.3542 -1.0478
## 4  7.8257      1 -1.7860 -0.7711
## 5  0.7346      0 -1.0068  1.2008
## 6 22.4002      0 -0.6357 -0.4936
```


Calculate the NRI using all estimators at future time 2.



```r
# bootstrap only 10 times to reduce computation for this example.
survNRI(time = "stime", event = "status", model1 = "y1", model2 = c("y1", "y2"), 
    data = SimData, predict.time = 2, method = "all", bootMethod = "normal", 
    bootstraps = 10, alpha = 0.05)
```

```
## 
##  Net Reclassification Improvement at time t = 2
##   with 95% bootstrap confidence intervals based on normal approximation.
## 
##  method     |  event NRI              non-event NRI             NRI 
## -------------------------------------------------------------------------------
##   KM        |  0.529 (0.471,0.586)   0.380 (0.324,0.353)   0.297 (0.243,0.434)   
##   IPW       |  0.531 (0.470,0.591)   0.380 (0.325,0.355)   0.301 (0.244,0.436)   
##   SmoothIPW |  0.527 (0.466,0.588)   0.381 (0.327,0.345)   0.291 (0.247,0.426)   
##   SEM       |  0.566 (0.500,0.631)   0.365 (0.306,0.460)   0.401 (0.187,0.579)   
##   Combined  |  0.544 (0.476,0.612)   0.374 (0.319,0.395)   0.339 (0.213,0.500)   
## -------------------------------------------------------------------------------
```


Now only estimate using the smooth IPW, SEM and combined methods. 


```r
tmp <- survNRI(time = "stime", event = "status", model1 = "y1", model2 = c("y1", 
    "y2"), data = SimData, predict.time = 3, method = c("SmoothIPW", "SEM", 
    "Combined"), bootMethod = "percentile", bootstraps = 10, alpha = 0.01)

# look at the results
tmp
```

```
## 
##  Net Reclassification Improvement at time t = 3
##   with 99% bootstrap confidence intervals based on percentiles.
## 
##  method     |  event NRI              non-event NRI             NRI 
## -------------------------------------------------------------------------------
##   SmoothIPW |  0.565 (0.499,0.652)   0.379 (0.362,0.437)   0.373 (0.175,0.576)   
##   SEM       |  0.582 (0.545,0.623)   0.368 (0.337,0.435)   0.428 (0.241,0.497)   
##   Combined  |  0.573 (0.503,0.632)   0.374 (0.366,0.434)   0.397 (0.228,0.514)   
## -------------------------------------------------------------------------------
```



```r
# access estimates and ci's
tmp$estimates
```

```
##           NRI.event NRI.nonevent    NRI
## SmoothIPW    0.5652       0.3787 0.3730
## SEM          0.5819       0.3680 0.4279
## Combined     0.5725       0.3740 0.3970
```

```r
tmp$CI
```

```
## $NRI.event
##            SmoothIPW    SEM Combined
## lowerbound    0.4990 0.5449   0.5030
## upperbound    0.6516 0.6230   0.6316
## 
## $NRI.nonevent
##            SmoothIPW    SEM Combined
## lowerbound    0.3621 0.3367   0.3658
## upperbound    0.4368 0.4355   0.4341
## 
## $NRI
##            SmoothIPW    SEM Combined
## lowerbound    0.1748 0.2411   0.2282
## upperbound    0.5764 0.4974   0.5139
```



for more information see `?survNRI`. 




