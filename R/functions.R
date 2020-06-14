#' Hitting the Binance API to get the most recent price of Bitcoin in USD
#'
#' This is a wrapper around \code{binancer} package...
#' @export
#' @param retried Number of retries in the previous step
#' @importFrom binancer binance_coins_prices
#' @import data.table
get_bitcoin_price <- function(retried = 0) {
  tryCatch(binance_coins_prices()[symbol == 'BTC']$usd,
           error = function (e) {
             # exponential backoff retries
             Sys.sleep(1 + retried ^ 2)
             get_bitcoin_price(retried = retried + 1)
           })
}

#' Formatting numbers as Hungarian Forints
#'
#' Wrapper around \code{scales} package
#' @export
#' @param x number
#' @importFrom scales dollar
<<<<<<< HEAD
forint <- function(x) {dollar(x, suffix = " HUF", prefix = NULL)}
=======
forint <- function(x) {dollar(x, suffix = "Ft", prefix = NULL)}



#' Querying historical exchange rates
#'
#' Specify the FXs and the days to go back in time
#' @export
#' @param from specify ccy code for fx to convert from
#' @param to specify ccy code for fx to convert to
#' @param num_days specify number of days to go back in time - returned days may be less due to non-business dates
#' @importFrom httr GET
#' @importFrom httr content
#' @import data.table
hist_FX <- function(from, to, num_days) {

  call <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = Sys.Date() - num_days,
      end_at   = Sys.Date(),
      base     = toupper(from),
      symbols  = toupper(to)
    ))

  content_call <- content(call)$rates

  return(data.table(date = as.Date(names(content_call)),
                    rate = as.numeric(unlist(content_call)))[order(-date)])

}
hist_FX('usd', 'huf', 3)
>>>>>>> 9f8913bd678a50ab671bf9ed0c6a2f9f70b85a3d
