
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
