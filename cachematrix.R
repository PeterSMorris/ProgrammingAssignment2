## Below is a pair of functions that cache the inverse of a matrix

## makeCacheMatrix produces a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  matrix1 <- NULL
  
  set <- function(y) {
    x <<- y
    matrix1 <<- NULL
  }
  
  get <- function() x
  setinverse <- function(solve) matrix1 <<- solve
  getinverse <- function() matrix1
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve computes the inverse of the matrix created by the function makeCacheMatrix
## If the inverse has already been calculated, 
## then the cachesolve will simply retrive the previously calculated value from the cache.

cacheSolve <- function(x, ...) {
  matrix1 <- x$getinverse()
  if(!is.null(matrix1)) {
    message("getting cached data")
    return(matrix1)
    
  }
  data <- x$get()
  matrix1 <- solve(data, ...)
  x$setinverse(matrix1)
  matrix1
}
