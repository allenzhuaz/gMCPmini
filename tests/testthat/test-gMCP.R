test_that("Testing case using Bonferroni-based Test", {
  m <- matrix(0, nrow = 4, ncol = 4)
  m[1,3] <- m[2,4] <- m[3,2] <- m[4,1] <- 1
  w <- c(1/2, 1/2, 0, 0)
  p1 <- c(0.01, 0.005, 0.01, 0.5)
  p2 <- c(0.01, 0.005, 0.015, 0.022)
  a <- 0.05
  g <- matrix2graph(m, w)
  result1 <- gMCP(g, pvalues=p1, alpha=a)
  result2 <- gMCP(g, pvalues=p2, alpha=a)

  expect_equal(unname(result1@rejected), c(TRUE, TRUE, TRUE, FALSE))
  expect_equal(unname(result1@adjPValues) < a, c(TRUE, TRUE, TRUE, FALSE))

  expect_equal(unname(result2@rejected), c(TRUE, TRUE, TRUE, TRUE))
  expect_equal(unname(result2@adjPValues) < a, c(TRUE, TRUE, TRUE, TRUE))

})

test_that("Testing case using weighted Simes' Test", {
  m <- matrix(0, nrow = 4, ncol = 4)
  m[1,3] <- m[2,4] <- m[3,2] <- m[4,1] <- 1
  w <- c(1/2, 1/2, 0, 0)
  p1 <- c(0.01, 0.005, 0.01, 0.5)
  p2 <- c(0.01, 0.005, 0.015, 0.022)
  a <- 0.05
  g <- matrix2graph(m, w)
  result1 <- gMCP(g, pvalues=p1, test="Simes", alpha=a)
  result2 <- gMCP(g, pvalues=p2, test="Simes", alpha=a)

  expect_equal(unname(result1@rejected), c(TRUE, TRUE, TRUE, FALSE))
  expect_equal(unname(result1@adjPValues) < a, c(TRUE, TRUE, TRUE, FALSE))

  expect_equal(unname(result2@rejected), c(TRUE, TRUE, TRUE, TRUE))
  expect_equal(unname(result2@adjPValues) < a, c(TRUE, TRUE, TRUE, TRUE))

})
