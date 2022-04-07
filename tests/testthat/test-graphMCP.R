test_that("Test graphMCP using user-defined matrix and weights", {

  m <- matrix(runif(16), nrow=4)
  weights <- c(0.1, 0.1, 0.1, 0)
  gR <- new("graphMCP", m=m, weights=weights)

  expect_equal(unname(getWeights(gR)), weights)
  expect_equal(unname(getMatrix(gR)), m)
})


test_that("Test graphMCP using BonferroniHolm", {
  bhG5 <- BonferroniHolm(5)
  matrix <- matrix(0.25,5,5)
  diag(matrix) <- 0
  expect_equal(unname(getWeights(bhG5)), c(0.2, 0.2, 0.2, 0.2, 0.2))
  expect_equal(unname(getMatrix(bhG5)), matrix)
})


test_that("Test graphMCP using Fixed sequence", {
  fs3 <- fixedSequence(3)
  matrix <- matrix(0,3,3)
  matrix[1,2] <- matrix[2,3] <- 1
  expect_equal(unname(getWeights(fs3)), c(1,0,0))
  expect_equal(unname(getMatrix(fs3)), matrix)
})


