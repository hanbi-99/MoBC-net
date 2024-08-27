
#' Class "MoBCresult"
#' This class represents the distance results of communities
#'
#'
#' @name MoBCresult-class
#' @docType class
#' @slot MoBCresult community distance result
#' @slot filtered.communities a list of community genes
#' @slot graph background network
#' @exportClass MoBCresult



setClass("MoBCresult",
        representation = representation(
            MoBCresult = "data.frame",
            filtered.communities = "list",
            graph = "igraph"
            )
         )
