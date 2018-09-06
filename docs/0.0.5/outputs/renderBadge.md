---
this: renderBadge
filename: R/badge.R
layout: page
roxygen:
  title: Badge outputs
  description: |-
    Small highlighted content which scales to its parent's size. Useful for
    displaying dynamically changing counts or tickers, drawing attention to new
    options, or tagging content.
  parameters:
  - name: id
    description: A character string specifying the id of the badge output.
  - name: '...'
    description: |-
      Additional named argument passed as HTML attributes to the parent
      element.
  - name: expr
    description: |-
      An expression which returns a character string specifying the
      label of the badge.
  - name: env
    description: |-
      The environment in which to evaluate `expr`, defaults to the
      calling environment.
  - name: quoted
    description: |-
      One of `TRUE` or `FALSE` specifying if `expr` is a quoted
      expression.
  sections: ~
  return: ~
  family: outputs
  name: ~
  rdname: ~
  examples:
  - title: Buttons with badges
    source: |-
      # Typically, you would use `renderBadge()` to update a badge's
      # value. Here we are hard-coding a default value of 7.
      buttonInput(
        id = NULL,
        label = "Process",
        badgeOutput(
          id = NULL,
          7
        ) %>%
          background("cyan")
      )
    output:
    - |-
      <button class="yonder-button btn btn-grey" type="button" role="button">
        Process
        <span class="yonder-badge badge badge-cyan">7</span>
      </button>
  - title: Possible colors
    source: |-
      colors <- c(
        "red", "purple", "indigo", "blue", "cyan", "teal", "green",
        "yellow", "amber", "orange", "grey", "white"
      )
      div(
        lapply(
          colors,
          function(color) {
            badgeOutput(
              id = NULL,
              color
            ) %>%
              background(color) %>%
              margin(2)
          }
        )
      ) %>%
        display("flex") %>%
        flex(wrap = TRUE)
    output:
    - |-
      <div class="d-flex flex-wrap">
        <span class="yonder-badge badge badge-red m-2">red</span>
        <span class="yonder-badge badge badge-purple m-2">purple</span>
        <span class="yonder-badge badge badge-indigo m-2">indigo</span>
        <span class="yonder-badge badge badge-blue m-2">blue</span>
        <span class="yonder-badge badge badge-cyan m-2">cyan</span>
        <span class="yonder-badge badge badge-teal m-2">teal</span>
        <span class="yonder-badge badge badge-green m-2">green</span>
        <span class="yonder-badge badge badge-yellow m-2">yellow</span>
        <span class="yonder-badge badge badge-amber m-2">amber</span>
        <span class="yonder-badge badge badge-orange m-2">orange</span>
        <span class="yonder-badge badge badge-grey m-2">grey</span>
        <span class="yonder-badge badge badge-white m-2">white</span>
      </div>
---