complete <- function(directory, id) {
        ## returns data frame of number of complete cases (nobs) each monitor
        ## (id) recorded
        
        ## directory is vector("character", 1) indicating location of csv files
        ## directory = "specdata"
        
        ## id is int vector of monitor ID numbers to be used
        
        nobs <- numeric() ## empty numeric vector to contain totals number of
        ## complete cases
        monitorList <- list.files(directory, full.names = TRUE)[id]
        ## char vector of desired monitor files
        
        for (i in seq_along(id)) {
                newNobs <- sum(complete.cases(read.csv(monitorList[i])))
                ## sums # of complete cases in a given monitor's data file
                nobs <- c(nobs, newNobs) 
                ## adds new monitor's # of complete cases to nobs vector
        }
        
        data.frame(id, nobs) 
        ## returns data frame of # complete cases and corresponding monitor ID#
}