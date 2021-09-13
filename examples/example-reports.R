df <- readr::read_csv(here::here("data", "joined.csv"))

dir.create(here::here("reports"), showWarnings = FALSE)


render_report <- function(fname, lname) {
  rmarkdown::render(
    here::here("examples","report.Rmd"),
    output_file = here::here("reports", paste0(fname, "-", lname, ".pdf")),
    params = list(first_name = fname,
                  last_name = lname)
  )
}

for (i in 1:10) {
  render_report(df$first_name[[i]], df$last_name[[i]])
}
