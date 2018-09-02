Lab 4: Fitting Poisson models
================

This session is concerned with Poisson point process models.
The lecturer's R script is [available here](https://raw.githubusercontent.com/spatstat/testWorkshop/master/Scripts/script04.R) (right click and save).

### Exercise 1

The command `rpoispp(100)` generates realisations of the Poisson process with intensity \(\lambda = 100\) in the unit square.

1.  Repeat the command `plot(rpoispp(100))` several times to build your intuition about the appearance of a completely random pattern of points.

2.  Try the same thing with intensity \(\lambda = 1.5\).

### Exercise 2

Returning to the Japanese Pines data,

1.  Fit the uniform Poisson point process model to the Japanese Pines data

    ``` {.r}
    ppm(japanesepines~1)
    ```

2.  Read off the fitted intensity. Check that this is the correct value of the maximum likelihood estimate of the intensity.

### Exercise 3

The `japanesepines` dataset is believed to exhibit spatial inhomogeneity.

1.  Plot a kernel smoothed intensity estimate.

2.  Fit the Poisson point process models with loglinear intensity (trend formula `~x+y`) and log-quadratic intensity (trend formula `~polynom(x,y,2)`) to the Japanese Pines data.

3.  extract the fitted coefficients for these models using `coef`.

4.  Plot the fitted model intensity (using `plot(fit)`)

5.  perform the Likelihood Ratio Test for the null hypothesis of a loglinear intensity against the alternative of a log-quadratic intensity, using `anova`.

6.  Generate 10 simulated realisations of the fitted log-quadratic model, and plot them, using `plot(simulate(fit, nsim=10))` where `fit` is the fitted model.

### Exercise 4

The `update` command can be used to re-fit a point process model using a different model formula.

1.  Type the following commands and interpret the results:

    ``` {.r}
    fit0 <- ppm(japanesepines ~ 1)
    fit1 <- update(fit0, . ~ x)
    fit1
    fit2 <- update(fit1, . ~ . + y)
    fit2
    ```

2.  Now type `step(fit2)` and interpret the results.

### Exercise 5

The `bei` dataset gives the locations of trees in a survey area with additional covariate information in a list `bei.extra`.

1.  Fit a Poisson point process model to the data which assumes that the intensity is a loglinear function of terrain slope and elevation (hint: use `data = bei.extra` in `ppm`).

2.  Read off the fitted coefficients and write down the fitted intensity function.

3.  Plot the fitted intensity as a colour image.

4.  extract the estimated variance-covariance matrix of the coefficient estimates, using `vcov`.

5.  Compute and plot the standard error of the intensity estimate (see `help(predict.ppm)`).

### Exercise 6

Fit Poisson point process models to the Japanese Pines data, with the following trend formulas. Read off an expression for the fitted intensity function in each case.

|Trend formula|Fitted intensity function|
|:------------|:------------------------|
|`~1`||
|`~x`||
|`~sin(x)`||
|`~x+y`||
|`~polynom(x,y,2)`||
|`~factor(x < 0.4)`||

### Exercise 7

Make image plots of the fitted intensities for the inhomogeneous models above.
