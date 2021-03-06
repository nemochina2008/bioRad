#' Plot a vertical profile (\code{vp})
#'
#' @param x A \code{vp} class object.
#' @param quantity Character string with the quantity to plot. See
#' \link[=summary.vp]{vp} for list of available quantities.
##' \itemize{
##'  \item{Aerial density related:}{'\code{dens}', '\code{eta}', '\code{dbz}',
##'    '\code{DBZH}' for density, reflectivity, reflectivity factor and total
##'    reflectivity factor, respectively.}
##'  \item{Ground speed related:}{'\code{ff}','\code{dd}', for ground speed
##'    and direction, respectively.}
##' }
#' @param xlab A title for the x axis.
#' @param ylab A title for the y axis.
#' @param line_col Color of the plotted curve.
#' @param line_lwd Line width of the plotted curve.
#' @param ... Additional arguments to be passed to the low level
#' \link[graphics]{plot} plotting function.
#' @param line.col Deprecated argument, use line_col instead.
#' @param line.lwd Deprecated argument, use line_lwd instead.
#'
#' @method plot vp
#'
#' @export
#'
#' @examples
#' data(example_vp)
#' plot(example_vp)
#' plot(example_vp, line_col = "blue")
plot.vp <- function(x, quantity = "dens",
                    xlab = expression("volume density [#/km"^3*"]"),
                    ylab = "height [km]", line_col = 'red',
                    line_lwd = 1, line.col = 'red', line.lwd = 1, ...) {
  stopifnot(inherits(x, "vp"))

  # deprecate function argument
  if (!missing(line.col)) {
    warning("argument line.col is deprecated; please use line_col instead.",
            call. = FALSE)
    line_col <- line.col
  }
  if (!missing(line.lwd)) {
    warning("argument line.lwd is deprecated; please use line_lwd instead.",
            call. = FALSE)
    line_lwd <- line.lwd
  }

  if (!(quantity %in% names(x$data))) {
    stop(paste("unknown quantity '", quantity, "'", sep = ""))
  }
  # set up the plot labels
  if (missing(xlab)) {
    xlab = switch(quantity,
                   "u" = "W->E ground speed component U [m/s]",
                   "v" = "N->S ground speed component V [m/s]",
                   "w" = "vertical speed W [m/s]",
                   "ff" = "ground speed [m/s]",
                   "dd" = "ground speed direction [deg]",
                   "sd_vvp" = "VVP-retrieved radial velocity standard deviation [m/s]",
                   "head_bl" = "heading baseline [unitless]",
                   "head_ff" = "heading amplitude [unitless]",
                   "head_dd" = "heading direction [deg]",
                   "head_sd" = "heading standard deviation [unitless]",
                   "dbz" = expression("reflectivity factor [dBZ"[e] * "]"),
                   "dens" = expression("volume density [#/km"^3*"]"),
                   "eta" = expression("reflectivity "*eta*" [cm"^2*"/km"^3*"]"),
                   "DBZH" = expression("total reflectivity factor [dBZ"[e] * "]"),
                   "gap" = "Angular data gap detected [logical]",
                   "n" = "# range gates in VVP velocity analysis",
                   "n_all" = "# range gates in sd_vvp estimate",
                   "n_dbz" = "# range gates in density estimates",
                   "n_dbz_all" = "# range gates in DBZH estimate",
                   quantity)
  }
  print(xlab)
  # extract the data from the time series object
  pdat <- get_quantity(x, quantity)
  plot(pdat, x$data$HGHT/1000, xlab = xlab, ylab = ylab, ...)
  points(pdat, x$data$HGHT/1000, col = line_col, lwd = line_lwd, type = "l")
}
