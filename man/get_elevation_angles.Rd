% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_elevation_angles.R
\name{get_elevation_angles}
\alias{get_elevation_angles}
\alias{get_elevation_angles.pvol}
\alias{get_elevation_angles.scan}
\alias{get_elevation_angles.param}
\title{Get elevation angles of a polar volume (\code{pvol}) or scan (\code{scan})}
\usage{
get_elevation_angles(x)

\method{get_elevation_angles}{pvol}(x)

\method{get_elevation_angles}{scan}(x)

\method{get_elevation_angles}{param}(x)
}
\arguments{
\item{x}{A \code{pvol} or \code{scan} object.}
}
\value{
elevation in degrees
}
\description{
Gives the elevation angle of a single scan, or the elevation angles of all scans within a
polar volume
}
\section{Methods (by class)}{
\itemize{
\item \code{pvol}: Elevation angles of all scans in a polar volume.

\item \code{scan}: Elevation angle of a scan.

\item \code{param}: Elevation angle of a scan parameter.
}}

\examples{
# load a polar volume
pvol <- system.file("extdata", "volume.h5", package="bioRad")
vol <- read_pvolfile(pvol)
# elevations for the scans in the volume
get_elevation_angles(vol)
# extract the first scan:
scan <- vol$scans[[1]]
# elevation angle of the scan:
get_elevation_angles(scan)
}
