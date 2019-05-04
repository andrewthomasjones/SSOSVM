context("Check R Functions")
library(SSOSVM)

test_that("Test Sims", {
  #set up for test
  N=10^3
  DIM=sample(2:6,1)

  result <- generateSim(N, 2, DIM, NULL)
  

  #types correct
  expect_is(result, "list")
  expect_is(result[[1]], "matrix")
  expect_is(result[[2]], "numeric")
  expect_is(result[[3]], "matrix")


  #dims
  expect_equal(result[[1]][1], N)
  expect_equal(result[[1]][2], DIM)
  expect_equal(length(result[[2]]), N)
  expect_equal(dim(result[[3]]), c(N,DIM+1))

  #no missing
  expect_identical(result, na.omit(result))

})

test_that("Test Hinge", {
  #set up for test
  N=10^3
  DIM=sample(2:6,1)

  YMAT <- generateSim(N, 2, DIM, NULL)
  EPSILON = 0.00001

  returnAll=TRUE
  rho=1.0

  result<-Hinge(YMAT$YMAT, DIM, returnAll, rho)

  #types correct
  expect_is(result, "list")
  expect_is(result[[1]], "numeric")
  expect_is(result[[2]], "integer")
  expect_is(result[[3]], "integer")
  expect_is(result[[4]], "matrix")
  expect_is(result[[5]], "numeric")

  #dims
  expect_equal(result[[2]], N)
  expect_equal(result[[3]], DIM)
  expect_equal(length(result[[1]]), DIM+1)
  expect_equal(dim(result[[4]]), c(N,DIM+1))

  #no missing
  expect_identical(result, na.omit(result))

})

test_that("Test Main SVM Function", {
  #set up for test
  N=10^3
  DIM=sample(2:6,1)

  YMAT <- generateSim(N, 2, DIM, NULL)

  result<-SVMFit(YMAT$YMAT)

  #types correct
  expect_is(result, "list")
  expect_is(result[[1]], "numeric")
  expect_is(result[[2]], "integer")
  expect_is(result[[3]], "integer")
  expect_is(result[[4]], "matrix")
  expect_is(result[[5]], "numeric")

  #dims
  expect_equal(result[[2]], N)
  expect_equal(result[[3]], DIM)
  expect_equal(length(result[[1]]), DIM+1)
  expect_equal(dim(result[[4]]), c(N,DIM+1))

  #no missing
  expect_identical(result, na.omit(result))

})

test_that("Test Main SVM Function method choices", {
  #set up for test
  N=10^3
  DIM=sample(2:6,1)
  
  YMAT <- generateSim(N, 2, DIM, NULL)
  
  result<-SVMFit(YMAT$YMAT, "Logistic")
  
  #types correct
  expect_is(result, "list")
  expect_is(result[[1]], "numeric")
  expect_is(result[[2]], "integer")
  expect_is(result[[3]], "integer")
  expect_is(result[[4]], "matrix")
  expect_is(result[[5]], "numeric")
  
  #dims
  expect_equal(result[[2]], N)
  expect_equal(result[[3]], DIM)
  expect_equal(length(result[[1]]), DIM+1)
  expect_equal(dim(result[[4]]), c(N,DIM+1))
  
  #no missing
  expect_identical(result, na.omit(result))
  
  result_h<-SVMFit(YMAT$YMAT, "Hinge")
  
  
  #types correct
  expect_is(result_h, "list")
  expect_is(result_h[[1]], "numeric")
  expect_is(result_h[[2]], "integer")
  expect_is(result_h[[3]], "integer")
  expect_is(result_h[[4]], "matrix")
  expect_is(result_h[[5]], "numeric")
  
  #dims
  expect_equal(result_h[[2]], N)
  expect_equal(result_h[[3]], DIM)
  expect_equal(length(result_h[[1]]), DIM+1)
  expect_equal(dim(result_h[[4]]), c(N,DIM+1))
  
  #no missing
  expect_identical(result_h, na.omit(result_h))
  
  
  result_s<-SVMFit(YMAT$YMAT, "SquareHinge")
  
  
  #types correct
  expect_is(result_s, "list")
  expect_is(result_s[[1]], "numeric")
  expect_is(result_s[[2]], "integer")
  expect_is(result_s[[3]], "integer")
  expect_is(result_s[[4]], "matrix")
  expect_is(result_s[[5]], "numeric")
  
  #dims
  expect_equal(result_s[[2]], N)
  expect_equal(result_s[[3]], DIM)
  expect_equal(length(result_s[[1]]), DIM+1)
  expect_equal(dim(result_s[[4]]), c(N,DIM+1))
  
  #no missing
  expect_identical(result_s, na.omit(result_s))
  
  expect_error(SVMFit(YMAT$YMAT, ""), "No method selected.")
  
})
