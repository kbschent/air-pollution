corr <- function(directory, threshold = 0) {
        ## returns numeric vector of correlations
        
        ## directory is vector("character", 1) indicating location of csv files
        ## directory = "specdata"
        
        ## threshold is vector("numeric", 1) indicating # of complete 
        ## observations (on all variables) required to compute correlation 
        ## between nitrate and sulfate; default is 0
        
        source("complete.R")
        
        correlations <- numeric() ## empty numeric vect for correlation values
        completeness <- complete(directory, seq_along(list.files(directory)))
                ## data frame of monitor IDs corresponding complete case pairs
        allMonitors <- list.files(directory, full.names = TRUE)
                ## char vect of of all files in "directory"
        thresholdIndeces <- which(completeness$nobs > threshold)
                ## int vect of IDs (& indeces of allMonitors) with complete 
                ## cases above "threshold"
        for (i in seq_along(thresholdIndeces)) {
                
                monitor <- read.csv(paste(directory, "/", 
                           formatC(thresholdIndeces[i], width=3, flag="0"), 
                           ".csv", sep=""))
                        ## reads data from corresponding monitor
                newCor <- cor(monitor$sulfate, monitor$nitrate, 
                          use = "pairwise.complete.obs")
                        ## calculates correlation between pollutants
                correlations <- c(correlations, newCor)
                        ## adds newCor to correlations vector
        }
        correlations
}