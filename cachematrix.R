##-------------------------------------------------
## Thomas J. Randall Jr
## Course ID: rprog-033
## Programming Assignment 2: Lexical Scoping
##
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


# makeVector: creates a special "vector", which is really a list containing a function to:
# 1. set the value of the vector
# 2. get the value of the vector
# 3. set the value of the mean
# 4. get the value of the mean
makeCacheMatrix <- function(x = matrix()) {

}


# cacheSolve: calculates the mean of the special "vector" created with the 
# makeVector function. However, it first checks to see if the mean has already 
# been calculated. If so, it gets the mean from the cache and skips the 
# computation. Otherwise, it calculates the mean of the data and sets the 
# value of the mean in the cache via the setmean function.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
