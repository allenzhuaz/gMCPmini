to.binom <- function(int, n = floor(log2(int)) + 1) {
  # 6 times faster than the old function (Thank you!)
  if (n + 2 <= floor(log2(int))) {
    stop("Vector length to small to hold binary number")
  }
  ((int) %/% 2^((n:1) - 1)) %% 2
}

parse.intersection <- function(binom) {
  paste("H(", paste(which(binom == 1), collapse = ","), ")", sep = "")
}

to.intersection <- function(int) {
  maxn <- floor(log2(max(int))) + 1
  if (length(int) > 1) {
    unlist(lapply(lapply(int, to.binom, n = maxn), parse.intersection))
  } else {
    parse.intersection(to.binom(int, n = maxn))
  }
}
