complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        nobs <- c()
        for (ix in id) {
                fn <- sprintf('%s/%03d.csv', directory, ix)
                dx <- complete.cases(read.csv(fn))
                nobs <- c(nobs, length(dx[dx==TRUE]))
        }
        data.frame(id, nobs)
}