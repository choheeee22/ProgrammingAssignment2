## There are two main functions in my code.
##First Part (makeCacheMatrix) - Creates an R object that stores a matrix and 
##its inverse matrix (which will be computed in 2nd function)

makeCacheMatrix <- function(x = matrix()) { 
  inv<-NULL
  set<-function(y){
     x<<-y
     inv<<-NULL
}
  get<-function() {x}
  setInverse<-function(inverse) {inv<<-inverse}
  getInverse<-function() {inv}
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}

## Second part, Now I'm going to use the argument from the first function.
##Will Continue to get inverse matrix,if I already had computed the matrix before,
##it will retreive the answer from cache, i/o coputing all again

cacheSolve <- function(x, ...) {
   inv<-x$getInverse()
   if(!is.null(inv)){
   message("getting cached data")
   return(inv)
}
   mat<-x$get()
   inv<-solve(mat,...)
   x$setInverse(inv)
   inv
        ## Return a matrix that is the inverse of 'x'
}

