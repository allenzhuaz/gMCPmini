# gMCPmini
  <!-- badges: start -->
  [![R-CMD-check](https://github.com/allenzhuaz/gMCPmini/workflows/R-CMD-check/badge.svg)](https://github.com/allenzhuaz/gMCPmini/actions)
  <!-- badges: end -->
  <!-- badges: start -->
  [![test-coverage](https://github.com/allenzhuaz/gMCPmini/workflows/test-coverage/badge.svg)](https://github.com/allenzhuaz/gMCPmini/actions)
  <!-- badges: end -->
  
`gMCPmini` contains a subset of functions from `gMCP`. The purpose is to remove package dependency of gMCP package including `rJAVA`. The selected functions ensure `gsDesign` can produce multiple comparision graph using `hGraph` function. 

## Installation

Please make sure to install the `devtools` package at first:


```r
# install.packages("devtools") if you have not installed the package
devtools::install_github("allenzhuaz/gMCPmini")

# devtools::install_github("Merck/gMCPmini") Placeholder for future moving to Merck's repository
```
