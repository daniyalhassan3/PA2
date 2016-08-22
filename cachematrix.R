## The function takes an invertible matrix and creates a matrix object to cache its inverse. 
## It then calcualtes the inverse if its a new matrix or retrieve the result from the cache.

## This function takes a squared matrix and caches it.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function()
    x
  
  setmatrix <- function(solve)
    m <<- solve
  getmatrix <- function()
    m
  
  list(
    set = set,
    get = get,
    setmatrix = setmatrix,
    getmatrix = getmatrix
  )
}


## This function calls the makeCacheMatrix function and solves for the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}