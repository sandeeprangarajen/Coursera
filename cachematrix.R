
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setinv<-function(inverse) m<<- inverse
getinv<-function() m
list(set=set, get=get,
   setinv=setinv,
   getinv=getinv)
}

cacheSolve <- function(x, ...) {
    m<-x$getinv()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    mat.data<-x$get()
    m<-solve(mat.data, ...)
    x$setmatrix(m)
   Return(m)
}
