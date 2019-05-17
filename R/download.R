
#' Download from Climate Watch Data
#'
#' @param data_sources
#' @param gases
#' @param sectors
#' @param regions
#' @param start_year
#' @param end_year
#' @param sort_col
#' @param sort_dir
#'
#' @return
#' @export
#'
#' @examples
cw_download <- function(
  data_sources = c("CAIT", "PIK", "UNFCCC"),
  gases = c("All GHG", "CO2", "CH4", "N2O", "F-Gas"),
  sectors = c(),
  regions,
  start_year,
  end_year,
  sort_col,
  sort_dir = c("ASC", "DESC")
) {
  url <- "https://www.climatewatchdata.org/api/v1/data/historical_emissions"

  resp <- httr::GET(url)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)
}

# response <- GET(api_url)
# jsonlite::fromJSON(content(response, "text"), simplifyVector = FALSE) %>% pluck("data") %>% as_tibble(.name_repair = "minimal") %>% view()
# content(response)
# headers(response)
# lengths()
# str(content(response))
# content(response, "parsed")
#
# meta <- httr::HEAD("https://www.climatewatchdata.org/api/v1/data/historical_emissions/meta")
# httr::headers(meta) %>%
#   unlist() %>%
#   tibble::enframe()
#
# library(tidyverse)
# dataframe <- sentences %>%
#   enframe(name = "rowid", value = "sentence") %>%
#   mutate(listcol = str_split(sentence, "\\s"))
# dataframe
#
# dataframe %>%
#   filter(map_lgl(listcol, ~ any(str_detect(., "The"))))


