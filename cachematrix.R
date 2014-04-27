## This R program defined two functions that create a special matrix object that
## stores its own inversion and contains setter and getter functions to return
## itself or the inversion.

## "makeCacheMatrix" is a function to create a matrix object that can store its
## own inversion.

makeCacheMatrix <- function(x = matrix()) {
	
	## Initialize the variable to store inversion of "x".
	invX <- NULL
	
	## Setter function
	set <- function(y) {
		x <<- y
		invX <<- NULL
	}
	
	## Getter function
	get <- function() x
	
	## Setter function for "invX"
	setInv <- function(inv) invX <<- inv
	
	## Getter function for "invX"
	getInv <- function() invX
	
	## Return the object (a list of above functions).
	list(set = set, get = get, setInv = setInv, getInv = getInv)
		
}


## "cacheSolve" is a function to compute the inversion of "x" and store it to the
## matrix object.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	
	invX <- x$getInv()
	
	## If the inversion exists, then directly return "invX".
	if (!is.null(invX)) {
		message("getting cached data")
		return(invX)
	}
	
	## If there is no inversion attached, calculate the inversion, attach it
	## to the matrix object and return the result.
	data <- x$get()
	invX <- solve(data, ...)
	
	## Attach the inversion to the matrix object "x"
	x$setInv(invX)
	
	## Return the calculated inversion as the function value.
	invX
}








