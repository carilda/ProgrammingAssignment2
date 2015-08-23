## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates the contained functions to create and store the
## matrix and its inverse, as well as to fetch the inverse if available

makeCacheMatrix <- function(x = matrix()) {

    ## initially, NULL out the inverse variable
    inv <- NULL

    ## stores the matrix only (not the inverse)
    set <- function(y) {

        ## set x in the parent function
        x <<- y

        ## inv is NULLed until the new inverse is calculated and stored
        inv <<- NULL
    }

    ## return the stored matrix
    get <- function() {
        x
    }

    ## stores the inverse of x calculated elsewhere
    setinv <- function(invrs) {
        inv <<- invrs
    }

    ## returns the stored matrix inverse
    getinv <- function() {
        inv
    }

    ## creates a list of the above functions for external calling
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function
## Checks if inverse already stored; if so, returns it else calculates,
## stores and returns it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## Try the cache
        inv <- x$getinv()

        ## if in cache, return it
        if (!is.null(inv)) {
            message("returning data from cache")
            return(inv)
        }

        ## not in cache - calculate it
        matr <- x$get
        inv <- solve(matr)

        ## store it in cache and return it.
        x$setinv(inv)
        inv
}

## Thx in advance to my reviewers!

