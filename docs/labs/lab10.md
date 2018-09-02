Lab 10: Gibbs processes
================

This session is concerned with Gibbs models for point patterns with interpoint interaction.
The lecturer's R script is [available here](https://raw.githubusercontent.com/spatstat/testWorkshop/master/Scripts/script10.R) (right click and save).

### Exercise 1

In this question we fit a Strauss point process model to the `swedishpines` data.

1.  We need a guess at the interaction distance \(R\). Compute and plot the \(L\)-function of the dataset and choose the value \(r\) which maximises the discrepancy \(|L(r)-r|\).

2.  Fit the stationary Strauss model with the chosen interaction distance using

    ``` {.r}
    ppm(swedishpines ~ 1, Strauss(R))
    ```

    where `R` is your chosen value.

    1.  Interpret the printout: how strong is the interaction?

    2.  Plot the fitted pairwise interaction function using `plot(fitin(fit))`.

### Exercise 2

In Question 1 we guesstimated the Strauss interaction distance parameter. Alternatively this parameter could be estimated by profile pseudolikelihood.

1.  Look again at the plot of the \(L\)-function of `swedishpines` and determine a plausible range of possible values for the interaction distance.

2.  Generate a sequence of values equally spaced across this range, for example, if your range of plausible values was \([5, 12]\), then type

    ``` {.r}
    rvals <- seq(5, 12, by=0.5)
    ```

3.  Construct a data frame, with one column named `r` (matching the argument name of `Strauss`), containing these values. For example

    ``` {.r}
    D <- data.frame(r = rvals)
    ```

4.  Execute

    ``` {.r}
    fitp <- profilepl(D, Strauss, swedishpines ~ 1)
    ```

    to find the maximum profile pseudolikelihood fit.

5.  Print and plot the object `fitp`.

6.  Compare the computed estimate of interaction distance \(r\) with your guesstimate. Compare the corresponding estimates of the Strauss interaction parameter \(\gamma\).

7.  Extract the fitted Gibbs point process model from the object `fitp` as

    ``` {.r}
    bestfit <- as.ppm(fitp)
    ```

### Exercise 3

For the Strauss model fitted in Question 1,

1.  Generate and plot a simulated realisation of the fitted model using `simulate`.

2.  Plot the \(L\)-function of the data along with the global simulation envelopes from 19 realisations of the fitted model.

### Exercise 4

1.  Read the help file for `Geyer`.

2.  Fit a stationary Geyer saturation process to `swedishpines`, with the same interaction distance as for the Strauss model computed in Question 2, and trying different values of the saturation parameter `sat = 1, 2, 3` say.

3.  Fit the same model with the addition of a log-quadratic trend.

4.  Plot the fitted trend and conditional intensity.

### Exercise 5

Modify question 1 by using the Huang-Ogata approximate maximum likelihood algorithm (`method="ho"`) instead of maximum pseudolikelihood (the default, `method="mpl"`).

### Exercise 6

Repeat Question 2 for the inhomogeneous Strauss process with log-quadratic trend. The corresponding call to `profilepl` is

``` {.r}
fitp <- profilepl(D, Strauss, swedishpines ~ polynom(x,y,2))
```

### Exercise 7

Repeat Question 3 for the inhomogeneous Strauss process with log-quadratic trend, using the inhomogeneous \(L\)-function `Linhom` in place of the usual \(L\)-function.
