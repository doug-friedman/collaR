#' Quickly read only specified columns from a csv using the column names
#'
#' @description Given the file, fields, and their classes,
#'              R will import only the relevant columns. 
#'              Knowing the indices or location of these columns is not necessary.
#' @param file the name of the csv file which the data are to be read from
#' @param fields the names of the columns in the csv that are to be read in
#' @param fields.class the classes of the columns (in order) using the readr notation
#'        (c = character, d = double, i = integer, l = logical)
#' @param n_max number of rows to read from the file
#'
#' @return A tibble data.frame containing only the specified columns of the data in the file
#' @seealso \code{\link[readr]{read_csv}}
#' @import readr
#' @export


extract_cols = function(file, fields, fields.class, n_max=-1){
  
  # File checks
  if(!is.character(file)){ stop("File information provided is not a character")}
  if(!file.exists(file)){ stop("File path is invalid")}
  
  #Fields check
  if(!is.character(fields)){ stop("Fields provided are not characters")}
  
  #Fields classes check
  if(!is.character(fields.class)){ stop("Field classes provided are not characters")}
  if(!any(fields.class %in% c("c","d","i","l"))){ stop("Field classes should be one of the following: c, d, i, l")}
  
  #Lengths check
  if(!length(fields) == length(fields.class)){ stop("Field class vector and field names are not the same")}
  
  # readr Library check
  if(!requireNamespace("readr", quietly = TRUE)) { stop("The readr package is required") }
  
  # Read the first line of the file
  first.line = read_csv(file, n_max = 1)

  # Check that the fields are present and get their indices
  if(all(fields %in% names(first.line))){
    fields.ind = which(names(first.line) %in% fields)
  } else{
    stop("The specified fields are not present")
  }

  # Leverages read_csv from the readr
  skip_code = rep("_", ncol(first.line))
  skip_code[fields.ind] = fields.class
  skip_code = paste0(skip_code, collapse="")

  
  return(read_csv(file, col_types = skip_code, n_max=n_max))
}
