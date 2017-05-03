# collaR
[![Travis-CI Build Status](https://travis-ci.org/doug-friedman/collaR.svg?branch=master)](https://travis-ci.org/doug-friedman/collaR)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/doug-friedman/collaR?branch=master&svg=true)](https://ci.appveyor.com/project/doug-friedman/collaR)
[![codecov.io](http://codecov.io/github/doug-friedman/collaR/coverage.svg?branch=master)](http://codecov.io/github/doug-friedman/collaR?branch=master)

This is an R package I developed to standardize code for a task I had to perform constantly - read data from a large csv file into R, but only certain columns otherwise it would be too big to store within memory. However, I would only know the names of the columns and not their location within the larger file. This package provides functionality to specify just the column names rather than the column indicies to selectively read data in from a large csv file. 

It uses all of the usual csv reading tricks and *one of* the fastest R libraries for doing so.
