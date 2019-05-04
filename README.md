
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/SSOSVM)](https://cran.r-project.org/package=SSOSVM)
[![Travis-CI Build
Status](https://travis-ci.org/andrewthomasjones/SSOSVM.svg?branch=master)](https://travis-ci.org/andrewthomasjones/SSOSVM)

# SSOSVM

The goal of SSOSVM is to use R to allow batch and online training of
soft-margin support vector machines (SVMs). The training of SVMs usually
requires that the data be available all at once in a single batch,
however the Stochastic majorization-minimization (SMM) algorithm
framework allows for the training of SVMs on streamed data instead
<doi:10.1007/s42081-018-0001-y>. This package utilizes the SMM framework
to provide functions for training SVMs with hinge loss, squared-hinge
loss, and logistic loss, functions. \#\# Installation

You can install SSOSVM from github with:

``` r
# install.packages("devtools")
devtools::install_github("andrewthomasjones/SSOSVM")
```

## Example

Here is a very simple example using simulated data:

``` r

#setup
library(SSOSVM)
library(ggplot2)
sims <- generateSim(10^2, DELTA=2)

#fit using various loss functions
sq1<-SVMFit(sims$YMAT,"square")
h1<-SVMFit(sims$YMAT,"hinge")
l1<-SVMFit(sims$YMAT,"logistic")

#plot results
plot<-ggplot(data.frame(sims$YMAT), aes(colour=factor(YY), x=V2, y=V3))
plot<-plot+geom_point()+theme_bw()+xlab("X")+ylab("Y")+guides(colour=FALSE)
plot<-plot+geom_abline(intercept=sq1$THETA[3], slope=sq1$THETA[2], colour="blue")
plot<-plot+geom_abline(intercept=h1$THETA[3], slope=h1$THETA[2], colour="green")
plot<-plot+geom_abline(intercept=l1$THETA[3], slope=l1$THETA[2], colour="red")
plot
```

![](README-unnamed-chunk-2-1.png)<!-- -->

## Animated figures

Here is an animated example to demostrate the online nature of of the
SSOSVM method:

``` r
library(ggplot2)
library(gganimate)
goo <- ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  # Here comes the gganimate code
  transition_states(
    gear,
    transition_length = 2,
    state_length = 1
  ) +
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

anim_save("goo.gif", goo)
```

![](goo.gif)
