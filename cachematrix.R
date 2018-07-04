## Put comments here that give an overall description of what your
## functions do

##create a "matrix object" that can cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {  i <- NULL ##matrix is initially empty
set <- function(y){ ##set initial matrix using child function
  x <<- y ##allows matrix values (x) to be modified via y
  i <<- NULL
}
get <- function(){ ##allows matrix values to be retrieved
  x
}
setInv <- function(inverse){
  i <<- inverse ###allows i to be modified, even though i and inverse are not in same environment
}
getInv <- function(){ ##retrives inverse of matrix
  i
}
list(set = set, ##creates list with cached values
     get = get,
     setmean = setmean,
     getmean = getmean)
}


## compute and return the inverse of matrix "x"

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInv
  if(!is.null(i)){ #logical operator that checks if argument is NULL or not 
    message("getting cached data")
    return(i)
  }
  matrix <- x$get() #assigns matrix all the values in  "get()" in list x 
  i <- inverse(matrix, ...)
  x$setInv(i)
  i
}
