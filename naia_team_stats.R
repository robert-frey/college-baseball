#' Title
#'
#' @param stat 4 options: Hitting, Extended Hitting, Pitching, Fielding
#' @param lvl 2 options: Overall Conference
#' @param season 3 options: 2020-21, 2021-22, 2022-23
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
scrape_team_stats <- function(stat = "Hitting", lvl = "Overall", season = "2021-22", ...) {
  
  #Diff Seasons 
  # 2020-21
  # 2021-22
  # 2022-23
  
  url <- paste0("https://naiastats.prestosports.com/sports/bsb/",season,"/teams?sort=&r=0&pos=h")
  
  tabl <- tibble::tibble(level = c("Overall","Overall","Overall","Overall",
                                   "Conference","Conference","Conference","Conference"),
                         type = rep(c("Hitting","Extended Hitting","Pitching","Fielding"),2),
                         code = c(1:8))
  
  table_num <- tabl %>% dplyr::filter(level == lvl, type == stat) %>% dplyr::pull(code)
  
  df <- url %>% xml2::read_html() %>% rvest::html_nodes('table') %>% 
    .[[table_num]] %>%
    rvest::html_table(trim=T)
  
  return(df)
  
}

### Example
#scrape_team_stats(level = "Overall", type = "Extended Hitting")