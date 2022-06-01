getLaTeXFraction <- function(x) {
  result <- c()
  for (nom in strsplit(as.character(getFractionString(x)), split = "/")) {
    if (length(nom) == 1) {
      result <- c(result, nom)
    } else {
      result <- c(result, paste("\\frac{", nom[1], "}{", nom[2], "}", sep = ""))
    }
  }
  return(result)
}
