##-------------------------------------------------
## Thomas J. Randall Jr
## Course ID: rprog-033
## Programming Assignment 2: Lexical Scoping
##-----------------------------------------------------------
## From the READ.ME
## Introduction:
## 
## This second programming assignment will require you to write an 
## R function is able to cache potentially time-consuming computations. 
## ...
## In this Programming Assignment will take 
## advantage of the scoping rules of the R language and how they can 
## be manipulated to preserve state inside of an R object.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# makeVector: creates a special "vector", which is really a list containing a function to:
# 1. set the value of the vector
# 2. get the value of the vector
# 3. set the value of the mean
# 4. get the value of the mean
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
makeCacheMatrix <- function(x = matrix()) {
    
    inverseVector <- NULL
    
    # get and set the matrix
    get <- function() x
    set <- function(y) {
        x <<- y
        inverseVector <<- NULL
    }
    
    # get and set the inverse
    getInverse <- function() inverseVector
    setInverse <- function(inverse) inverseVector <<- inverse
    
    # Returns matrix with functions
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# cacheSolve: calculates the mean of the special "vector" created with the 
# makeVector function. However, it first checks to see if the mean has already 
# been calculated. If so, it gets the mean from the cache and skips the 
# computation. Otherwise, it calculates the mean of the data and sets the 
# value of the mean in the cache via the setmean function.
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
cacheSolve <- function(x, ...) {
    inverseVector <- x$getInverse()
    
    # simply return if the inverse is already set
    if (!is.null(inverseVector)) {
        message("returning cached data instead of caluculating")
        return(inverseVector)
    }
    
    # calculate the inverse
    data <- x$get()
    inverseVector <- solve(data, ...)
    
    # cache the inverseVector
    x$setInverse(inverseVector)
    
    # Return the vector
    inverseVector
}
