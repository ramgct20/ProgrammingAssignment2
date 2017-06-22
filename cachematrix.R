

## Write a short comment describing this function
#  set() the value of the matrix
#  get() the value of the matrix
#  setinv() the value of the inverse
#  getinv() the value of the inverse

makeCacheMatrix <- function(x = matrix()) 
  {
    inv <- NULL
   set <- function(y) 
    {
        x <<- y
        inv <<- NULL
    }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
  }	

# Below function calculates the inverse of the special "matrix" created
# with the above function. It initialy checks to see if the inverse
# has already been caclulated and available. If available , the function get's the inverse from the cache
# and skips the computation. else, it calculates the matrix inverse


cacheSolve <- function(x, ...) 
  {
  
    if(!is.null(inv)) 
      {
        message("getting cached result")
        return(inv)
      }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
  }	
