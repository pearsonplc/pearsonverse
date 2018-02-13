Overview
--------

`pearsonverse` is a collection of packages that make it easier to conduct an exploratory data science project in R from start to end. The **pearsonverse** package itself allows you to easily install and load the core `pearsonverse` packages in a single command.

Installation
------------

``` r
devtools::install_github("pearsonplc/pearsonverse")
```

Usage
-----

`library(pearsonverse)` will load the core `pearsonverse` packages:

-   <a href = "https://github.com/pearsonplc/skelpear" target = "_blank">skelpear</a>, for building a project environment and maintaining a reproducibility.
-   <a href = "https://github.com/pearsonplc/reppear" target = "_blank">reppear</a>, for building reproducible reports with a standardised layout.
-   <a href = "https://github.com/pearsonplc/vispear" target = "_blank">vispear</a>, for creating visualisations with a coherent layout.

When you load the **pearsonverse** library, you'll see that it loads the three packages:

``` r
library(pearsonverse)
```

    #> ── Attaching packages ─────────────────────────────────────────────────── pearsonverse 1.0.0 ──

    #> ✔ vispear  1.0.0
    #> ✔ reppear  1.0.0
    #> ✔ skelpear 1.0.0

Data Science Workflow
---------------------

1. Load the **pearsonverse** packages.

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

The `packages.dcf` file lists all attached packages used during the project. It is especially useful when there are more people involved in code development and when an identical package environment is critical.

4. Save your package environment.

``` r
skelpear::snapshot_pkg()
```

The function will save your package environment in `config/packages.dcf` file. Once you push it to a bitbucket repository, anybody can pull it and compare it with the local package envrionment via the `compare_snapshot` function. You can find more info about these functions in <a href = "https://github.com/pearsonplc/skelpear" target = "_blank">skelpear</a> package introduction.

5. Create a repository on bitbucket and link it to the local project.

6. Now you can start writing your code.

7. Once you're ready to prepare a report with your analysis, use the `report_create` function.

8. Initialize the report environment.

``` r
reppear::report_create(file = "01_report")
```

By default, the report environment will be stored in `reports` directory. More info about the structure of report directory <a href = "https://github.com/pearsonplc/reppear" target = "_blank">here</a>.

9. Once you've finalised your report, prepare `index.Rmd` file which acts as home page for your report/s.

10. Render all files in the `report` directory.

``` r
reppear::render_all()
```

11. Then you're ready to publish the whole `reports` directory on your server.

``` r
reppear::publish()
```
