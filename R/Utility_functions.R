#'SSOSVM: A package for online training of soft-margin support vector machines (SVMs) using the Stochastic majorization–minimization (SMM) algorithm.
#'
#'The SSOSVM package allows for computation...
#'
#'@author Andrew T. Jones,  Hien D. Nguyen, Geoffrey J. McLachlan
#'@references  Hien D. Nguyen, Andrew T. Jones and Geoffrey J. McLachlan. (2018). Stream-suitable optimization algorithms for some soft-margin support vector machine variants, Japanese Journal of Statistics and Data Science, vol. 1, Issue 1, pp. 81-108. 
#'@docType package
#'@name SSOSVM
NULL

#'Generate Simulations
#'@description Generate simple simulations for testing of the algorithms.
#'@param NN Number of observations. Default is 10^4
#'@param DELTA Separation of thre groups in standard errors. Default is 2.
#'@param DIM Number of dimensions in data. Default is 2.
#'@param seed Random seed if desired.
#'@return A list containing:
#'\item{XX}{Coordinates of the simulated points.}
#'\item{YY}{Cluster membership of the simulated points.}
#'#'\item{YMAT}{YY and XX Combined as a single matrix.}
#'@examples
#'#100 points of dimension 4.
#'generateSim(NN=100, DELTA=2, DIM=4)
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
  
  return(list(XX=XX, YY=YY,YMAT=YMAT))
}