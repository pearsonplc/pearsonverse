Overview
--------

`pearsonverse` is a set of packages which facilitates the data science process in R. The **pearsonverse** package is designed to make it easy to install and load core packages from the pearsonverse in a single command.

Installation
------------

``` r
devtools::install_github("pearsonplc/pearsonverse")
```

Usage
-----

`library(pearsonverse)` will load the core `pearsonverse` packages:

-   <a href = "https://github.com/pearsonplc/skelpear" target = "_blank">skelpear</a>, for building a project environment and maintaining a reproducibility.
-   <a href = "https://github.com/pearsonplc/reppear" target = "_blank">reppear</a>, for building a reproducible report with standardised layout.
-   <a href = "https://github.com/pearsonplc/vispear" target = "_blank">vispear</a>, for creating visualisation with coherent layout.

You also get a condensed summary when you have loaded:

``` r
library(pearsonverse)
```

    #> ── Attaching packages ────────────────────────────────────────────────── pearsonverse 1.0.0 ──

    #> ✔ vispear  1.0.0
    #> ✔ reppear  1.0.0
    #> ✔ skelpear 1.0.0

Data Science Workflow
---------------------

1. Attach all pearson packages.

``` r
library(pearsonverse)
```

2. Create a new project. It will open a new session.

``` r
skelpear::project_create(project_name = "example_project")
```

3. In the console, the warning shows up:

``` r
"Warning: There is no `packages.dcf` file in your project. 
Please use `snapshot_pkg` function to save your package environment."
```

The `packages.dcf` file lists all attached packages used during the project. It is especially useful when there are more people involved in a code development and when identical package environment is critical.

4. Save your package environment.

``` r
skelpear::snapshot_pkg()
```

The function will save your package environment in `config/packages.dcf` file. Once you push it to the bitbucket repository, anybody can pull it and compare to the local package envrionment via `compare_snapshot` function. You can find more info about these functions in <a href = "https://github.com/pearsonplc/skelpear" target = "_blank">skelpear</a> package introduction.

5. Create a repository on bitbucket and link it to the local project.

6. Then you can start producing code.

7. Once you're ready to prepare a report with your analysis, use `report_create` function.

8. Initialize report environment.

``` r
reppear::report_create(file = "01_report")
```

By default, the report environment will be stored in `reports` directory. More info about the structure of report directory <a href = "https://github.com/pearsonplc/reppear" target = "_blank">here</a>.

9. Once you finalised your report, prepare `index.Rmd` file which acts as home page for your report/s.

10. Render all files in `report` directory.

``` r
reppear::render_all()
```

11. Then you're ready to publish the whole `reports` directory on your server.

``` r
reppear::publish()
```
