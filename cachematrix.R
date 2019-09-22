## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  matrix1 <- NULL
  set <- function(y) {
    x <<- y
    matrix1 <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) matrix1 <<- solve
  getinverse <- function() matrix1
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

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
