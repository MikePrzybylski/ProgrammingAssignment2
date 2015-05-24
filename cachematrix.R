## Put comments here that give an overall description of what your
## functions do

##  makeVector creates a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the (solve) inverse matrix
## get the value of the (solve) inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y ## y is assigned to x. This will cause a search to made through parent environments for an existing definition.
  m<<-NULL ##null is assigned to m and cached
}
get<-function() x ##assign function() x to get
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}


## Write a short comment describing this function
##cacheSolve calculates the inverse of the matrix. It first checks to see if
##the inverse has already been calculated. If so, it takes the cached valiue 
##and bypasses the calculation. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m) ##returns the result of the expression
    }
    matrix1<-x$get()
    m<-solve(matrix1, ...)
    x$setmatrix(m)
    m
}
