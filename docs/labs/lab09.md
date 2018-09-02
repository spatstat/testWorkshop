Lab 9: Cluster and Cox processes
================

This session is concerned with summary statistics for interpoint spacing and distances.
The lecturer's R script is [available here](https://raw.githubusercontent.com/spatstat/testWorkshop/master/Scripts/script09.R) (right click and save).

### Exercise 1

The command `rThomas` generates simulated realisations of the Thomas model (‘modified Thomas cluster process’).

1.  Read the help file.

2.  Type `plot(rThomas(10, 0.05, 8))` a few times, and interpret the results.

3.  Experiment with the arguments of `rThomas` to obtain point patterns that
    1.  consist of a few, well-separated, very tight clusters of points;
    2.  look similar to realisations of a uniform Poisson process.

### Exercise 2

1.  Read the help file for `kppm`.

2.  Fit the Thomas model to the `redwood` data by the method of minimum contrast:

    ``` {.r}
    fit <- kppm(redwood ~ 1, clusters="Thomas")
    fit
    plot(fit)
    ```

3.  Read off the parameters of the fitted model, and generate a simulated realisation of the fitted model using `rThomas`.

4.  Type `plot(simulate(fit))` to generate a simulated realisation of the fitted model automatically.

5.  Try the command

    ``` {.r}
    fit2 <- kppm(redwood ~ 1, clusters="Thomas", startpar=c(kappa=10, scale=0.1))
    ```

    and briefly explore the fitting algorithm’s sensitivity to the initial guesses at the parameter values `kappa` and `scale`.

6.  Generate and plot several simulated realisations of the fitted model, to assess whether it is plausible.

7.  Extract and plot the fitted pair correlation function by

    ``` {.r}
    pcffit <- pcfmodel(fit)
    plot(pcffit, xlim = c(0, 0.3))
    ```

8.  Type `plot(envelope(fit, Lest, nsim=39))` to generate simulation envelopes of the \(L\) function from this fitted model. Do they suggest the model is plausible?

### Exercise 3

1.  Fit a Matern cluster process to the `redwood` data.

2.  Use `vcov` to estimate the covariance matrix of the parameter estimates.

3.  Compare with the covariance matrix obtained when fitting a homogeneous Poisson model.
