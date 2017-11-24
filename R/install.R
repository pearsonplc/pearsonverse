
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
