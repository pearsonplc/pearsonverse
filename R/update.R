# Add to DESCRIPTION file
# ...
# Suggests:
# repperar (== 0.1.0),
# vispear (== 0.1.0)
# ...

# library(stringr)
#
# df <- installed.packages()
# suggests <- df %>% as.data.frame() %>% dplyr::filter(Package == "pearsonverse") %>%
#   dplyr::pull(Suggests) %>%
#   as.character()
#
# sep_pkg <- suggests %>% str_replace_all("\n", "") %>%
#   str_split(",") %>% unlist()
#
#
# test <- function() {
#   pkg_name <- sep_pkg %>% word()
#   pkg_version <- sep_pkg %>%
#     str_replace_all("\\(|\\)", "") %>%
#     str_extract_all("\\(?[0-9,.]+\\)?") %>%
#     unlist()
#
#
#   data.frame(pkg_name, pkg_version)
# }
#
# test()
#
