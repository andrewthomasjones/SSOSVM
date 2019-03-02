#'SSOSVM: A package for online training of soft-margin support vector machines (SVMs) using the Stochastic majorization–minimization (SMM) algorithm.
#'
#'The SSOSVM package allows for computation...
#'
#'@author Andrew T. Jones,  Hien D. Nguyen, Geoffrey J. McLachlan
#'@references  Hien D. Nguyen, Andrew T. Jones and Geoffrey J. McLachlan. (2018). Stream-suitable optimization algorithms for some soft-margin support vector machine variants, Japanese Journal of Statistics and Data Science, vol. 1, Issue 1, pp. 81-108. 
#'@docType package
#'@name SSOSVM
NULL

#'@importFrom grDevices gray
#'@importFrom graphics image
NULL

#'TITLE
#'@description THIS FUNCTION DOES
#'@param PARAM1
#'@param PARAM2
#'@return RETURNVAL
#'@examples
#'@export
generateSim <- function(NN = 10^4, DELTA = 2, DIM = 2, seed=NULL) {
  if(!is.null(seed)){set.seed(seed)}
  # Simulation
  XX <- mvtnorm::rmvnorm(round(NN/2),rep(DELTA,DIM))
  XX <- rbind(XX,mvtnorm::rmvnorm(NN-round(NN/2),rep(-DELTA,DIM)))
  # XX <- scale(XX)
  SAMPLE <- sample(1:NN)
  XX <- XX[SAMPLE,]
  YY <- c(rep(-1,round(NN/2)),rep(1,NN-round(NN/2)))
  YY <- YY[SAMPLE]
  YMAT <- cbind(YY,YY*XX)
  
  return(list(YMAT=YMAT, XX=XX, YY=YY))
}


# helper function for visualization
#'TITLE
#'@description THIS FUNCTION DOES
#'@param PARAM1
#'@param PARAM2
#'@return RETURNVAL
#'@examples
#'@export
show_digit = function(arr784, col = gray(12:1 / 12), ...) {
  image(matrix(as.matrix(arr784[-785]), nrow = 28)[, 28:1], col = col, ...)
}

# load image files
#'TITLE
#'@description THIS FUNCTION DOES
#'@param PARAM1
#'@param PARAM2
#'@return RETURNVAL
#'@examples
#'@export
load_image_file = function(filename) {
  ret = list()
  f = file(filename, 'rb')
  readBin(f, 'integer', n = 1, size = 4, endian = 'big')
  n    = readBin(f, 'integer', n = 1, size = 4, endian = 'big')
  nrow = readBin(f, 'integer', n = 1, size = 4, endian = 'big')
  ncol = readBin(f, 'integer', n = 1, size = 4, endian = 'big')
  x = readBin(f, 'integer', n = n * nrow * ncol, size = 1, signed = FALSE)
  close(f)
  data.frame(matrix(x, ncol = nrow * ncol, byrow = TRUE))
}

# load label files
#'TITLE
#'@description THIS FUNCTION DOES
#'@param PARAM1
#'@param PARAM2
#'@return RETURNVAL
#'@examples
#'@export
load_label_file = function(filename) {
  f = file(filename, 'rb')
  readBin(f, 'integer', n = 1, size = 4, endian = 'big')
  n = readBin(f, 'integer', n = 1, size = 4, endian = 'big')
  y = readBin(f, 'integer', n = n, size = 1, signed = FALSE)
  close(f)
  y
}


