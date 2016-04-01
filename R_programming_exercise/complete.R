complete <- function(directory, id = 1:332){
    filename <- NaN
    mydateset <- data.frame()
    
    for(i in id){
        if (i < 10)
            filename <- paste(directory, "/00", as.character(i), ".csv", sep ="")
        else if (i >=10 && i < 100)
            filename <- paste(directory, "/0", as.character(i), ".csv", sep ="")
        else
            filename <- paste(directory, "/", as.character(i), ".csv", sep ="")
        f <- read.csv(filename)
        
        mydateset <- rbind(mydateset, c(i, length(f$ID[!is.na(f$sulfate) & !is.na(f$nitrate)])))
        
    }
    names(mydateset) <- c("id", "nobs")
    mydateset
}