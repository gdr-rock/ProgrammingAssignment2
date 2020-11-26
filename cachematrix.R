## makeCacheMatrix() builds a set of functions and returns the functions (list) to the parent environment

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) 
    m <<- inverse
  getInverse <- function()  m
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve() populates and/or retrieves the inverse of a Matrix from an object of type makeCacheMatrix()


cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  # Return a matrix that is the inverse of 'x'
  if(!is.null(m)){
    message("Getting cached data")
    return(m)
  }
  # Or retrive original matrix from makeCacheMatrix() type object
  # send its inversion to both cacheSolve() output and makeCacheMatrix() cashed inv
  mat <- x$get()
  m <- solve(mat,...)
  x$setInverse(m)
  j
}