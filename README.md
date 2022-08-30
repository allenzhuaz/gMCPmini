**NOTE: this repo has been archived, please use the [gMCPLite repo](https://github.com/Merck/gMCPLite) to contribute codes or raise issues.**

# gMCPmini <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->
[![R-CMD-check](https://github.com/allenzhuaz/gMCPmini/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/allenzhuaz/gMCPmini/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/allenzhuaz/gMCPmini/workflows/test-coverage/badge.svg)](https://github.com/allenzhuaz/gMCPmini/actions)
[![Codecov test coverage](https://codecov.io/gh/allenzhuaz/gMCPmini/branch/main/graph/badge.svg)](https://app.codecov.io/gh/allenzhuaz/gMCPmini?branch=main)
<!-- badges: end -->

`gMCPmini` contains a subset of functions from `gMCP`. The purpose is to remove package dependency of gMCP package including `rJAVA`. The selected functions ensure `gsDesign` can produce multiple comparison graph and sequential graphs updates using `hGraph` function and `gMCP` result object. 


## Installation

```r
# Install development version from GitHub:
# install.packages("remotes")
remotes::install_github("allenzhuaz/gMCPmini")

# Install production version from CRAN
install.packages("gMCPmini")
```
