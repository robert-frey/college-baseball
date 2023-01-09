#' Title
#'
#' @param stat 4 options: Hitting, Extended Hitting, Pitching, Fielding
#' @param div 3 options: 1, 2, or 3
#' @param season 3 options: 2020-21, 2021-22, 2022-23
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
scrape_juco_team_stats <- function(stat = "Hitting", div = 1, season = "2021-22", ...) {
  
  #Diff Seasons 
  # 2018-19
  # 2020-21
  # 2021-22
  # 2022-23
  
  url <- paste0("https://www.njcaa.org/sports/bsb/",season,"/div",div,"/teams?sort=&r=0&pos=h")
  
  tabl <- tibble::tibble(
                         type = c("Hitting","Extended Hitting","Pitching","Fielding"),
                         code = c(1:4))
  
  table_num <- tabl %>% dplyr::filter(type == stat) %>% dplyr::pull(code)
  
  df <- url %>% xml2::read_html() %>% rvest::html_nodes('table') %>% 
    .[[table_num]] %>%
    rvest::html_table(trim=T)
  
  return(df)
  
}

### Example
#scrape_juco_team_stats(stat = "Hitting", div = 1, season = "2021-22")