\name{getEstimates}
\alias{getEstimates}
\title{get Risk estimates and standard errors, called from SurvRM}
\usage{
  getEstimates(data, cutpoint, measures, predict.time,
    CalVar, cutoff.type = "none", cutoffN = 100)
}
\arguments{
  \item{data}{data.frame of xi (surv time), di (event ind),
  and Y (marker)}

  \item{measures}{character vector of measures wanted, can
  be a subset of c("AUC", "beta", "TPR", "FPR", "PPV",
  "NPV")}

  \item{predict.time}{numeric prediction time to evaluate
  measures at}

  \item{CalVar}{Logical, should standard errors be
  calculated?}
}
\value{
  a list consisting of 'est' with point estimates in order
  of 'measures' and (if CalVar == TRUE), 'sd' with standard
  errors for estimates.
}
\description{
  get Risk estimates and standard errors, called from
  SurvRM
}

