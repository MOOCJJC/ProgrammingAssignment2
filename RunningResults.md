### Running Results

This file show the running results on my own computer.

```r

> test <- rnorm(9)
> dim(test) <- c(3,3)
> test
           [,1]       [,2]       [,3]
[1,] -1.1550917  1.0292266  0.6376822
[2,] -0.2709376 -0.5080896 -2.0931775
[3,] -0.3313135  0.9857861  1.0644931
> source.with.encoding('./Git_local/MOOCJJC/ProgrammingAssignment2/cachematrix.R', encoding='UTF-8')
> test2 <- makeCacheMatrix(test)
> test2
$set
function (y) 
{
    x <<- y
    invX <<- NULL
}
<environment: 0x00000000128900c8>

$get
function () 
x
<environment: 0x00000000128900c8>

$setInv
function (inv) 
invX <<- inv
<environment: 0x00000000128900c8>

$getInv
function () 
invX
<environment: 0x00000000128900c8>

> test2$get()
           [,1]       [,2]       [,3]
[1,] -1.1550917  1.0292266  0.6376822
[2,] -0.2709376 -0.5080896 -2.0931775
[3,] -0.3313135  0.9857861  1.0644931
> test2$getInv()
NULL
> cacheSolve(test2)
           [,1]       [,2]       [,3]
[1,] -1.4843314  0.4552590  1.7843887
[2,] -0.9572505  0.9927415  2.5255268
[3,]  0.4244887 -0.7776447 -0.8440048
> test2$getInv()
           [,1]       [,2]       [,3]
[1,] -1.4843314  0.4552590  1.7843887
[2,] -0.9572505  0.9927415  2.5255268
[3,]  0.4244887 -0.7776447 -0.8440048
> cacheSolve(test2)
getting cached data
           [,1]       [,2]       [,3]
[1,] -1.4843314  0.4552590  1.7843887
[2,] -0.9572505  0.9927415  2.5255268
[3,]  0.4244887 -0.7776447 -0.8440048
> test2 %*% test2$getInv()
Error in test2 %*% test2$getInv() : 
  requires numeric/complex matrix/vector arguments
> test2$get() %*% test2$getInv()
              [,1]          [,2]          [,3]
[1,]  1.000000e+00 -5.551115e-17 -1.110223e-16
[2,] -1.110223e-16  1.000000e+00  0.000000e+00
[3,] -1.665335e-16  1.110223e-16  1.000000e+00
> 
```