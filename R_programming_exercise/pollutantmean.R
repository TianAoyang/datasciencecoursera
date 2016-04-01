pollutantmean <- function(directory, pollutant, id = 1:332){
    ##打开csv，统计pollutant
    filename <- NaN
    v <- c()
    for(i in id){
        if (i < 10)
            filename <- paste(directory, "/00", as.character(i), ".csv", sep ="")
        else if (i >=10 && i < 100)
            filename <- paste(directory, "/0", as.character(i), ".csv", sep ="")
        else
            filename <- paste(directory, "/", as.character(i), ".csv", sep ="")
        f <- read.csv(filename)
        if(pollutant == "sulfate")
            v <- c(v, f$sulfate[!is.na(f$sulfate)])
        else
            v <- c(v, f$nitrate[!is.na(f$nitrate)])
        
    }
    ##返回值
    mean(v)
    
}