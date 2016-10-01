pollutantmean <- function(directory, pollutant, id) { 
        ## Returns mean of pollutant across specified list of monitors
        
        ## directory is vector("character", 1) indicating location of csv files
        ## directory = "specdata"
        
        ## pollutant is vector("character", 1) indicating name of pollutant
        ## either "sulfate" or "nitrate"
        
        ## id is int vector of monitor ID numbers to be used
        
        totalReadings <- numeric() ## empty numeric vector to contain all datacor
        ## on desired pollutant from specified monitors
        monitorList <- list.files(directory, full.names = TRUE)[id]  
        ## char vector of desired monitor files
        
        for(i in seq_along(id)) {
                ## loop concatenates all data into one vector
                monitor <- read.csv(monitorList[i]) 
                newReadings <- monitor[[pollutant]]
                totalReadings <- c(totalReadings, newReadings) 
        }
        
        mean(totalReadings, na.rm = TRUE)
} 