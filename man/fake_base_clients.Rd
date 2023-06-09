% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fake_client.R
\name{fake_base_clients}
\alias{fake_base_clients}
\title{Create a fake base of tickets}
\usage{
fake_base_clients(n, local = c("en_US", "fr_FR"), seed = 2811)
}
\arguments{
\item{n}{the number of clients}

\item{local}{the local of the base. Currently supported : "fr_FR" and "en_US".}

\item{seed}{the random seed, default is 2811}
}
\value{
A dataframe of fake clients.
}
\description{
A fake base of customer support tickets
}
\examples{
fake_base_clients(n = 10)
fake_base_clients(n = 10, local = "fr_FR")

}
