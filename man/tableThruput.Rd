% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/table.R
\name{tableThruput}
\alias{tableThruput}
\alias{renderTable}
\title{Table thruput}
\usage{
tableThruput(id, ..., borders = "rows", striped = FALSE,
  compact = FALSE, responsive = FALSE, editable = FALSE)

renderTable(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{id}{A character string specifying the id of the table thruput. This id
is used as both an input and output reactive.}

\item{...}{Additional named arguments passed as HTML attributes to the parent
element.}

\item{borders}{One of \code{"rows"}, \code{"all"}, or \code{"none"} specifying what borders
are applied to the table, defaults to \code{"rows"}. \code{"rows"} will apply borders
between table rows. \code{"all"} will apply borders between table rows and
columns. \code{"none"} removes all borders from the table.}

\item{striped}{One \code{TRUE} or \code{FALSE} specifying if the table rows alternate
between light and darker backgrounds.}

\item{compact}{One of \code{TRUE} or \code{FALSE} specifying if the table cells are
rendered with less space, defaults to \code{FALSE}.}

\item{responsive}{One of \code{TRUE} or \code{FALSE} specifying if the table is allowed
to scroll horizontally, default to \code{FALSE}. This is useful when fitting
wide tables onto small viewports.}

\item{editable}{One of \code{TRUE} or \code{FALSE} specifying if the user can edit
table cells, defaults to \code{FALSE}.}

\item{expr}{An expression which returns a data frame or \code{NULL}. If a data
frame is returned the table thruput is re-rendered, otherwise if \code{NULL} the
current table is left as is.}

\item{env}{The environment in which to evaluate \code{expr}, defaults to
\code{parent.frame()}.}

\item{quoted}{One of \code{TRUE} or \code{FALSE} specifying if \code{expr} is a quoted
expression.}
}
\description{
Use \code{tableThruput()} to create a table output you can update with
\code{renderTable()}. Access selected table columns by referencing the same
table id as an input.
}
\examples{

if (interactive()) {
  shinyApp(
    ui = container(
      row(
        column(
          width = 6,
          tableThruput(
            id = "table1",
            responsive = TRUE,
            editable = TRUE
          )
        ),
        column(
          width = 6,
          verbatimTextOutput("value")
        )
      )
    ),
    server = function(input, output) {
      observeEvent(input$table1, once = TRUE, {
        showAlert("Click a table cell to edit the value!", color = "amber")
      })

      output$table1 <- renderTable({
        iris
      })

      output$value <- renderPrint({
        input$table1
      })
    }
  )
}

if (interactive()) {
  shinyApp(
    ui = container(
      row(
        column(
          tableThruput(
            id = "table1",
            borders = "all",
            responsive = TRUE
          )
        ),
        column(
          tableThruput(
            id = "table2",
            borders = "all",
            responsive = TRUE
          )
        )
      )
    ),
    server = function(input, output) {
      output$table1 <- renderTable({
        mtcars[1:10, ]
      })

      output$table2 <- renderTable({
        input$table1
      })
    }
  )
}

}
\seealso{
Other thruputs: \code{\link{listGroupThruput}}
}
\concept{thruputs}
