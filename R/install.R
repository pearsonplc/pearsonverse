
core <- c("vispear", "reppear")

core_not_installed <- function() {

  pkg_installed <- utils::installed.packages() %>%
    as.data.frame() %>%
    dplyr::filter(Package %in% core) %>%
    dplyr::pull(Package) %>%
    as.character()

  core[!core %in% pkg_installed]
}

pearsonverse_install <- function() {

  to_install <- core_not_installed()

  if (length(to_install) == 0)
    return(invisible())

  login <- rstudioapi::showPrompt("", "Bitbucket login:", default = "")
  pass <- rstudioapi::askForPassword("Bitbucket password:")

  msg(
    cli::rule(
      left = crayon::bold("Installing package/s")
    ),
    startup = TRUE
  )

  lapply(to_install, function(x) {
    install_pkgpear(x, login, pass, quiet = TRUE)
    msg(
      paste0(
        crayon::green(cli::symbol$tick), " ",
        crayon::blue(format(x))
      ),
      startup = TRUE)
  })

  invisible()
}

#'
#' Install \emph{*pear} package
#'
#' Function which allows you to install \emph{*pear} package.
#'
#' Regarding \emph{pass} argument, ideally, use default value: \emph{pass = NULL}. After that,
#' the popup window shows up which ask you for your bitbucket password. In that case, your password
#' will not be stored in memory. Alternatively, you can use your local .Renviron file.
#'
#' @export
#' @param pkg package name
#' @param login bitbucket login.
#' @param pass bitbucket password. You should not put your password directly. Read details.
#' @param quiet if TRUE suppresses output from this function.
#' @example
#' \dontrun{
#' install_pkgpear("vispear", login = "mikobogu")
#' }

install_pkgpear <- function(pkg, login, pass = NULL, quiet = FALSE) {

  if (is.null(pass)) {
    pass <- rstudioapi::askForPassword("Bitbucket password:")
  }

  repo <- paste0("bitbucket.pearson.com/scm/ef/", pkg, ".git")

  url <- paste0("https://", login, "@", repo)

  # Install ENR packages
  devtools::install_git(url = url,
                        credentials = git2r::cred_user_pass(
                          login, pass),
                        build_vignettes = TRUE,
                        quiet = quiet
  )
}
