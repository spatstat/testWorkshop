Lab 7: Envelopes and Monte Carlo tests
================

This session is concerned with evelopes of summary statistics and Monte Carlo tests.
The lecturer's R script is [available here](https://raw.githubusercontent.com/spatstat/testWorkshop/master/Scripts/script07.R) (right click and save).

### Exercise 1

For the `swedishpines` data:

1.  Plot the \(K\) function along with pointwise envelopes from 39 simulations of CSR:

    ``` {.r}
    plot(envelope(swedishpines, Kest, nsim=39))
    ```

2.  Plot the \(L\) function along with pointwise envelopes from 39 simulations of CSR.

3.  Plot the \(L\) function along with **simultaneous** envelopes from **19** simulations of CSR, using `ginterval=c(0,0.5)`.

4.  Plot the \(L\) function for along with **simultaneous** envelopes from **99** simulations of CSR using `ginterval=c(0,0.5)`. What is the significance level of the associated test?

### Exercise 2

To understand the difficulties with the \(K\)-function when the point pattern is not spatially homogeneous, try the following experiment (like in the previous lab session).

1.  Generate a simulated realisation of an inhomogeneous Poisson process, e.g.

    ``` {.r}
    X <- rpoispp(function(x,y){ 200 * exp(-3 * x) })
    ```

2.  Compute simulation envelopes (of your favorite type) of the \(K\)- or \(L\)-function under CSR. They may well indicate significant departure from CSR.

3.  Fit a Poisson point process model to the `japanesepines` data with log-quadratic trend (formula `~polynom(x,y,2)`). Plot the \(L\)-function of the data along with simultaneous envelopes from 99 simulations **of the fitted model**.
