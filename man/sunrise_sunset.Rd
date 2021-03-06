% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sunrise_sunset.R
\name{sunrise_sunset}
\alias{sunrise_sunset}
\alias{sunrise}
\alias{sunset}
\title{Calculate sunrise or sunset for a time and place}
\usage{
sunrise(date, lon, lat, elev = -0.268, tz = "UTC")

sunset(date, lon, lat, elev = -0.268, tz = "UTC")
}
\arguments{
\item{date}{Date inhereting from class \code{POSIXt} or a string
interpretable by \link[base]{as.Date}.}

\item{lon}{Longitude in decimal degrees.}

\item{lat}{Latitude in decimal degrees.}

\item{elev}{Sun elevation in degrees.}

\item{tz}{output time zone. Ignored if \code{date} has an associated time zone already}
}
\value{
The moment of sunrise or sunset in UTC time.
}
\description{
Calculate sunrise or sunset for a time and place
}
\details{
The angular diameter of the sun is about 0.536 degrees,
therefore the moment of sunrise/sunset corresponds to half that elevation
at -0.268 degrees.

This is a convenience function mapping to \link[maptools]{crepuscule}.

Approximate astronomical formula are used, therefore the moment of
sunrise / sunset may be off by a few minutes
}
\examples{
# sunrise in the Netherlands
sunrise("2016-01-01", 5, 53)
# sunset in the Netherlands
sunset("2016-01-01", 5, 53)
# civil twilight in Ithaca, NY, today
sunrise(Sys.time(), -76.5, 42.4, elev = -6)

}
