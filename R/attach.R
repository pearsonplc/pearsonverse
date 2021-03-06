
core <- c("vispear", "reppear", "skelpear")

core_loaded <- function() {
  search <- paste0("package:", core)
  core[search %in% search()]
}

core_unloaded <- function() {
  search <- paste0("package:", core)
  core[!search %in% search()]
}

pearsonverse_attach <- function() {
  to_load <- core_unloaded()
  if (length(to_load) == 0)
    return(invisible())
  msg(
    cli::rule(
      left = crayon::bold("Attaching packages"),
      right = paste0("pearsonverse ", package_version("pearsonverse"))
    ),
    startup = TRUE
  )
  versions <- vapply(to_load, package_version, character(1))
  packages <- paste0(
    crayon::green(cli::symbol$tick), " ", crayon::blue(format(to_load)), " ",
    crayon::col_align(versions, max(crayon::col_nchar(versions)))
  )
  info <- paste0(packages)
  msg(paste(info, collapse = "\n"), startup = TRUE)
  suppressPackageStartupMessages(
    lapply(to_load, library, character.only = TRUE, warn.conflicts = FALSE)
  )
  invisible()
}

package_version <- function(x) {
  version <- as.character(unclass(utils::packageVersion(x))[[1]])
  if (length(version) > 3) {
    version[4:length(version)] <- crayon::red(as.character(version[4:length(version)]))
  }
  paste0(version, collapse = ".")
}
