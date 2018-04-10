#' Class 'scan': polar scan
#' @param object object of class 'scan'
#' @param x object of class 'scan'
#' @param ... additional arguments affecting the summary produced.
#' @export
#' @method summary scan
#' @details
#' A polar scan object of class 'scan' is a list containing:
#' \describe{
#'  \item{\code{radar}}{character string with the radar identifier}
#'  \item{\code{datetime}}{nominal time of the volume to which this scan belongs [UTC]}
#'  \item{\code{params}}{a list with scan parameters}
#'  \item{\code{attributes}}{list with the scans's \code{\\what}, \code{\\where} and \code{\\how} attributes}
#'  \item{\code{geo}}{geographic data, a list with:
#'     \describe{
#'      \item{\code{lat}}{latitude of the radar [decimal degrees]}
#'      \item{\code{lon}}{longitude of the radar [decimal degrees]}
#'      \item{\code{height}}{height of the radar antenna [metres above sea level]}
#'      \item{\code{elangle}}{radar beam elevation [degrees]}
#'      \item{\code{rscale}}{range bin size [m]}
#'      \item{\code{ascale}}{azimuth bin size [deg]}
#'     }
#'     The \code{geo} element of a 'scan' object is a copy of the \code{geo} element of its parent polar volume of class 'pvol'.
#'   }
#' }
#' @examples
#' # load example scan object
#' data(SCAN)
#' # print the scan parameters contained in the scan:
#' SCAN$params
#' # extract the first scan parameter:
#' param=SCAN$params[1]
summary.scan=function(object, ...) print.scan(object)

#' @rdname summary.scan
#' @export
#' @return for \code{is.scan}: \code{TRUE} if its argument is of class "\code{scan}"
#' @examples
#' is.scan("this is not a polar scan but a string")  #> FALSE
is.scan <- function(x) inherits(x, "scan")

#' @rdname summary.scan
#' @export
#' @return for \code{dim.scan}: dimensions of the scan
dim.scan <- function(x) {
  stopifnot(inherits(x,"scan"))
  c(length(x$params),x$attributes$where$nbins,x$attributes$where$nrays)
}

#' print method for class \code{scan}
#'
#' @param x An object of class \code{scan}, a polar scan
#' @keywords internal
#' @export
print.scan=function(x,digits = max(3L, getOption("digits") - 3L), ...){
  stopifnot(inherits(x, "scan"))
  cat("                  Polar scan (class scan)\n\n")
  cat("     parameters: ",names(x$params),"\n")
  cat("elevation angle: ",x$attributes$where$elangle,"deg\n")
  cat("           dims: ",x$attributes$where$nbins,"bins x",x$attributes$where$nrays,"rays\n")
}

#' Extract a scan from a polar volume
#'
#' Extract a scan from a polar volume
#' @param x an object of class 'pvol'
#' @param angle elevation angle
#' @export
#' @return an object of class '\link[=summary.scan]{scan}'.
#' @details The function returns the scan with elevation angle closest to \code{angle}
#' @examples
#' # locate example volume file:
#' pvol <- system.file("extdata", "volume.h5", package="bioRad")
#' # load the file:
#' vol=read.pvol(pvol)
#' # extract the scan at 3 degree elevation:
#' myscan = getscan(vol,3)
getscan = function(x,angle){
  stopifnot(inherits(x,"pvol"))
  x$scans[[which.min(abs(elangle(x)-angle))]]
}