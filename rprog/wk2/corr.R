corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations between sulfate and nitrate.
        ## NOTE: Do not round the result!
        dlen <- complete(directory)
        cors <- c()
        for (ix in 1:length(dlen$id)) {
                if (dlen[ix,]$nobs <= threshold) {
                        next
                }
                dx <- read.csv(sprintf('%s/%03d.csv', directory, ix))
                cr1 <- cor(dx['sulfate'], dx['nitrate'], 'complete.obs')
                cors <- c(cors, cr1)
        }
        cors
}