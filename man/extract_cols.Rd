% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_cols.R
\name{extract_cols}
\alias{extract_cols}
\title{Quickly read only specified columns from a csv using the column names}
\usage{
extract_cols(file, fields, fields.class, n_max = -1)
}
\arguments{
\item{file}{the name of the csv file which the data are to be read from}

\item{fields}{the names of the columns in the csv that are to be read in}

\item{fields.class}{the classes of the columns (in order) using the readr notation
(c = character, d = double, i = integer, l = logical)}

\item{n_max}{number of rows to read from the file}
}
\value{
A tibble data.frame containing only the specified columns of the data in the file
}
\description{
Given the file, fields, and their classes,
             R will import only the relevant columns. 
             Knowing the indices or location of these columns is not necessary.
}
\seealso{
\code{\link[readr]{read_csv}}
}
