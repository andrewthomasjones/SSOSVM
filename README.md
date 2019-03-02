
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/SSOSVM)](https://cran.r-project.org/package=SSOSVM)
[![Travis-CI Build
Status](https://travis-ci.org/andrewthomasjones/SSOSVM.svg?branch=master)](https://travis-ci.org/andrewthomasjones/SSOSVM)

# SSOSVM

The goal of SSOSVM is to …

## Installation

You can install SSOSVM from github with:

``` r
# install.packages("devtools")
devtools::install_github("andrewthomasjones/SSOSVM")
```

## Example

This is a basic example which shows you how to solve a common problem:

## Animated figures

``` r
library(ggplot2)
for (count in 1:4) {
  
  n <- 10 ^ count
  x <- data.frame(var = rnorm(n))
  print(ggplot(x) +
    geom_histogram(aes(x = var), binwidth = 0.2) +
    ggtitle(paste('n =', n)))
}
```

<video controls loop>

<source src="README-unnamed-chunk-2.webm" />

</video>

``` r2
library(SSOSVM)
library(ggplot2)

YMAT <- generateSim(10^4)
sq1<-SquareHinge(YMAT$YMAT,returnAll =T)
h1<-Hinge(YMAT$YMAT,returnAll =T)
l1<-Logistic(YMAT$YMAT,returnAll =T)

# do it iteratively with ggplot2
```

<!-- ############################################ -->

<!-- # # download data from http://yann.lecun.com/exdb/mnist/ -->

<!-- # download.file("http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz", -->

<!-- #               "train-images-idx3-ubyte.gz") -->

<!-- # download.file("http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz", -->

<!-- #               "train-labels-idx1-ubyte.gz") -->

<!-- # download.file("http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz", -->

<!-- #               "t10k-images-idx3-ubyte.gz") -->

<!-- # download.file("http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz", -->

<!-- #               "t10k-labels-idx1-ubyte.gz") -->

<!-- #  -->

<!-- # # gunzip the files -->

<!-- # R.utils::gunzip("train-images-idx3-ubyte.gz") -->

<!-- # R.utils::gunzip("train-labels-idx1-ubyte.gz") -->

<!-- # R.utils::gunzip("t10k-images-idx3-ubyte.gz") -->

<!-- # R.utils::gunzip("t10k-labels-idx1-ubyte.gz") -->

<!-- # load images -->

<!-- train = load_image_file("train-images-idx3-ubyte") -->

<!-- test  = load_image_file("t10k-images-idx3-ubyte") -->

<!-- testlab  = (load_label_file("t10k-labels-idx1-ubyte")) -->

<!-- trainlab = (load_label_file("train-labels-idx1-ubyte")) -->

<!-- k=1 -->

<!-- YY<-2.0*((trainlab==k)-.5) -->

<!-- YY2<-2.0*((testlab==k)-.5) -->

<!-- pca1<-princomp(train) -->

<!-- B=2 -->

<!-- test1<-predict(pca1, newdata = test)[,1:B] -->

<!-- #set<-sample(c(which(trainlab==1), sample(which(trainlab!=1), length(which(trainlab==1))) -->

<!-- trainpc<-pca1$scores[set,1:B] -->

<!-- YMAT <- cbind(YY[set],as.matrix(trainpc)) -->

<!-- M=20 -->

<!-- set<-sample(60000,M) -->

<!-- B=784 -->

<!-- YMAT <- cbind(YY[set],as.matrix(train[set,])) -->

<!-- ptm <- proc.time() -->

<!-- h2<-HingeC(YMAT, DIM = B, returnAll =F) -->

<!-- x2<-proc.time() - ptm -->

<!-- x2 -->

<!-- xl<- sign(rowSums(t(apply(test1, 1 , `*` , l2$THETA[-(1)] )))+l2$THETA[(1)])  -->

<!-- xsq<- sign(rowSums(t(apply(test1, 1 , `*` , sq2$THETA[-(1)] )))+sq2$THETA[(1)])  -->

<!-- xh<- sign(rowSums(t(apply(test1, 1 , `*` , h2$THETA[-(1)] ))) +h2$THETA[(1)])  -->

<!-- if(B==2){ -->

<!--   plot(trainpc, pch=(YY[set]+2),col=as.factor(YY[set]+2), ylim=c(min(trainpc[,2]),max(trainpc[,2])), xlim=c(min(trainpc[,1]),max(trainpc[,1])), xlab="X1",ylab="X2") -->

<!--   curve(-sq2$THETA[1]/sum(sq2$THETA[-c(1,2)])-sq2$THETA[2]/sum(sq2$THETA[-c(1,2)])*x, col='orange',add=T) -->

<!--   curve(-h2$THETA[1]/sum(h2$THETA[-c(1,2)])-h2$THETA[2]/sum(h2$THETA[-c(1,2)])*x,col='pink',add=T) -->

<!--   curve(-l2$THETA[1]/sum(l2$THETA[-c(1,2)])-l2$THETA[2]/sum(l2$THETA[-c(1,2)])*x,col='green',add=T) -->

<!-- } -->

<!-- pred<-xl -->

<!-- truth<-YY2 -->

<!-- xtab1 <- table(pred, truth) -->

<!-- confusionMatrix(xtab1) -->

<!-- pred<-xsq -->

<!-- xtab2<- table(pred, truth) -->

<!-- confusionMatrix(xtab2) -->

<!-- pred<-xh -->

<!-- xtab3<- table(pred, truth) -->

<!-- confusionMatrix(xtab3) -->

<!--  plot(YMAT$XX,pch=(YMAT$YY+2),col=heat.colors(sq1$NN)[1:sq1$NN]) -->

<!--  curve(-sq1$THETA[1]/sq1$THETA[3]-sq1$THETA[2]/sq1$THETA[3]*x,from=min(YMAT$XX),to=max(YMAT$XX),col='black',add=T) -->

<!--  curve(-sq2$THETA[1]/sq2$THETA[3]-sq2$THETA[2]/sq2$THETA[3]*x,from=min(YMAT$XX),to=max(YMAT$XX),col='blue',add=T) -->

<!--  curve(-h1$THETA[1]/h1$THETA[3]-h1$THETA[2]/h1$THETA[3]*x,from=min(YMAT$XX),to=max(YMAT$XX),col='blue',add=T) -->

<!--  curve(-l1$THETA[1]/l1$THETA[3]-l1$THETA[2]/l1$THETA[3]*x,from=min(YMAT$XX),to=max(YMAT$XX),col='green',add=T) -->

<!-- ```{r example} -->

<!-- ## basic example code -->

<!-- ``` -->
