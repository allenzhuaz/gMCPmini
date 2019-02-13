#' Example Graph
#'
#' @export
BonferroniHolm <- function(n, weights=rep(1/n, n)) {
  if (missing(n)) { stop("Please provide the number of hypotheses as parameter n.") }
  hnodes <- paste("H", 1:n, sep="")
  m <- matrix(1/(n-1), nrow=n, ncol=n)
  diag(m) <- 0
  rownames(m) <- colnames(m) <- hnodes
  BonferroniHolm <- new("graphMCP", m=m, weights=weights)
  # Visualization settings
  nodeX <- 100+(0:(n-1))*200
  nodeY <- rep(200, n)
  BonferroniHolm@nodeAttr$X <- nodeX
  BonferroniHolm@nodeAttr$Y <- nodeY
  # Label settings
  for (i in 1:n) {
    n1 <- hnodes[i]
    for (j in (1:n)[-i]) {
      n2 <- hnodes[j]
      x <- ((i+j)*200-200)/2
      y <- 200 + ((i-j)*50)
      edgeAttr(BonferroniHolm, n1, n2, "labelX") <- x
      edgeAttr(BonferroniHolm, n1, n2, "labelY") <- y
    }
  }
  attr(BonferroniHolm, "description") <- paste("Graph representing the (unweighted) Bonferroni-Holm-Procedure",
                                               "",
                                               #"Most powerful test procedure (without further assumptions) that treats all hypotheses equally.",
                                               "The graph is a complete graph, where all nodes have the same weights and each edge weight is 1/(n-1).",
                                               "",
                                               "Literature: Holm, S. (1979). A simple sequentally rejective multiple test procedure. Scandinavian Journal of Statistics 6, 65-70.", sep="\n")
  return(BonferroniHolm)
}

checkValidWeights <- function(weights) {
  if(!is.numeric(weights)) {
    stop("Weights have to be numeric!")
  }
  if(any(is.na(weights) | is.infinite(weights))) {
    warning("Some of the weights are not real numbers. NA, NaN, Inf and -Inf are not supported.")
  }
  if(any(0 > weights | weights > 1 + .Machine$double.eps ^ 0.25)) {
    warning("Invalid weights: weights must be between 0 and 1")
  }
  if(sum(weights) > 1 + .Machine$double.eps ^ 0.25) {
    warning("Invalid weights: the sum of all weights must be less than 1")
  }
}

#' Substitute Epsilon
#'
#' Substitute Epsilon with a given value.
#'
#' For details see the given references.
#'
#' @param graph A graph of class \code{\link{graphMCP}} or class
#' \code{\link{entangledMCP}}.
#' @param eps A numeric scalar specifying a value for epsilon edges.
#' @return A graph where all epsilons have been replaced with the given value.
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @seealso \code{\link{graphMCP}}, \code{\link{entangledMCP}}
#' @keywords print graphs
#'
#'
#' @export substituteEps
substituteEps <- function(graph, eps=10^(-3)) {
  # Call this function recursivly for entangled graphs.
  if ("entangledMCP" %in% class(graph)) {
    for(i in 1:length(graph@subgraphs)) {
      graph@subgraphs[[i]] <- substituteEps(graph@subgraphs[[i]], eps)
    }
    return(graph)
  }
  # Real function:
  if (is.numeric(graph@m)) return(graph)
  m <- matrix(gsub("\\\\epsilon", eps, graph@m), nrow=length(getNodes(graph)))
  options(warn=-1)
  m2 <- matrix(sapply(m, function(x) {
    result <- try(eval(parse(text=x)), silent=TRUE);
    ifelse(class(result)=="try-error",NA,result)
  }), nrow=length(getNodes(graph)))
  options(warn=0)
  if (all(is.na(m)==is.na(m2))) m <- m2
  rownames(m) <- colnames(m) <- getNodes(graph)
  graph@m <- m
  return(graph)
}
