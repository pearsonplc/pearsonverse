.onAttach <- function(...) {
  inst_needed <- core[!is_installed(core)]

  pearsonverse_install()

  att_needed <- core[!is_attached(core)]
  if (length(att_needed) == 0)
    return()

  cli::cat_line("")

  Sys.sleep(2)

  crayon::num_colors(TRUE)
  pearsonverse_attach()

}

is_installed <- function(x) {
  pkg_installed <- utils::installed.packages() %>%
    as.data.frame() %>%
    dplyr::filter(Package %in% core) %>%
    dplyr::pull(Package) %>%
    as.character()

  x %in% pkg_installed
}

is_attached <- function(x) {
  paste0("package:", x) %in% search()
}
