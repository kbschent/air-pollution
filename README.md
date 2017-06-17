# air-pollution
air pollution R files for Data Science Course

## file descriptions and dependencies

### pollutantmean.R
contains function that returns mean of specified pollutant across specified list of monitors
arguments: directory, pollutant, id

### complete.R
contains function that returns data frame of number of complete cases (nobs) each monitor(id) recorded
arguments: directory, id

### corr.R
contains function that returns numeric vector of correlations between nitrate and sulfate readings from monitors with complete cases above desired threshold
arguments: directory, threshold
source calls: complete.R
