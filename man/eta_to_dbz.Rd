% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dbz_eta.R
\name{eta_to_dbz}
\alias{eta_to_dbz}
\title{Convert reflectivity to reflectivity factor}
\usage{
eta_to_dbz(eta, wavelength, K = 0.93)
}
\arguments{
\item{eta}{reflectivity in cm^2/km^3}

\item{wavelength}{radar wavelength in cm}

\item{K}{norm of the complex refractive index of water}
}
\value{
reflectivity factor in dBZ
}
\description{
Convert reflectivity to reflectivity factor
}
