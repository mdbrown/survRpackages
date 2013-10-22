survRpackages
=============

R packages for prospective biomarker validation with time-to-event data developed in collaboration with [Yingye Zheng](http://www.fhcrc.org/en/labs/profiles/zheng-yingye.html) and [Tianxi Cai](http://www.hsph.harvard.edu/tcai/).


### Estimation
- [**survAccuracyMeasures**](http://mdbrown.github.io/survAccuracyMeasures/): Estimate the AUC, TPR(c), FPR(c), PPV(c), and NPV(c) for for a specific timepoint and marker cutoff value c. Standard errors and confidence intervals are also computed. Either analytic or bootstrap standard errors can be computed.

- [**survMarkerTwoPhase**](http://mdbrown.github.io/survMarkerTwoPhase/): Evaluate the prognostic accuracy of a marker under two phase designs (case-cohort and nested case control designs).

- [**survCompetingRisk**](http://mdbrown.github.io/survCompetingRisk/): Evaluate the prognostic accuracy of a marker with multiple competing risk events. Functions to calculate the AUC, ROC, PPV, and NPV are provided. A discrete covariate Z, if available, can be included.

- [**survNRI**](http://mdbrown.github.io/survNRI/): Calculate the net reclassification index (NRI) statistic for survival data using five different estimators.


### Power Calculations
[Shiny](http://www.rstudio.com/shiny/) web applications to simulate power for risk prediction accuracy measures for time-to-event data using semi-parametric accuracy estimates.

- [**Cohort data**](http://glimmer.rstudio.com/mdbrown/PowerSAM/)
- [**Case-Cohort data**](http://glimmer.rstudio.com/mdbrown/PowerSAM_cch/)
