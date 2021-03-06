% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_null.R
\name{compute.null}
\alias{compute.null}
\title{Compute the null value for pedigrees}
\usage{
compute.null(pedigree.configurations, pedigree.probas)
}
\arguments{
\item{pedigree.configurations}{is all possible configurations for people having the risk allele: A list}

\item{pedigree.probas}{is all probabilities associated with all pedigree configurations: A list}
}
\value{
The expected genotype value, variance and covariance for each pedigree within a data.frame
}
\description{
This function computes the genotype null value for one or more families. It assumes that the
the first parameter is a list with all the possible family configurations while the second
parameter is a list with all the sharing probabilities for the all family configurations
}
