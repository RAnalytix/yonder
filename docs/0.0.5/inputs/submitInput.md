---
this: submitInput
filename: R/button.R
layout: page
roxygen:
  title: Button and submit inputs
  description: |-
    Button inputs are useful as triggers for reactive or observer expressions.
    The reactive value of a button input is the number of times it has been
    clicked.

    A submit input is a special type of button used to control HTML form
    submission. Unlike shiny's `submitButton`, yonder's submit inputs will not
    freeze all reactive inputs on the page.
  parameters:
  - name: id
    description: A character string specifying the id of the button or link input.
  - name: label
    description: |-
      A character string specifying the label text on the button
      input.
  - name: block
    description: |-
      If `TRUE`, the input is block-level instead of inline, defaults
      to `FALSE`. A block-level element will occupy the entire width of its
      parent element.
  - name: text
    description: |-
      A character string specifying the text displayed as part of the
      link input.
  - name: '...'
    description: |-
      Additional named arguments passed as HTML attributes to the parent
      element.
  sections: ~
  return: ~
  family: inputs
  name: ~
  rdname: ~
  examples:
  - title: Simple vs block button
    source: |-
      buttonInput(
        id = NULL,
        label = "Simple"
      ) %>%
        background("green")
      # Block buttons will fill the width of their parent element
      buttonInput(
        id = NULL,
        label = "Block",
        block = TRUE
      ) %>%
        background("red")
    output:
    - <button class="yonder-button btn btn-green" type="button" role="button">Simple</button>
    - <button class="yonder-button btn btn-block btn-red" type="button" role="button">Block</button>
  - title: A submit button
    source: submitInput()
    output:
    - <button class="yonder-submit btn btn-blue" data-type="submit" role="button">Submit</button>
  - title: Possible colors
    source: |-
      colors <- c(
        "red", "purple", "indigo", "blue", "cyan", "teal", "green",
        "yellow", "amber", "orange", "grey"
      )
      div(
        lapply(
          colors,
          function(color) {
            buttonInput(
              id = NULL,
              label = color
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
        <button class="yonder-button btn btn-red m-2" type="button" role="button">red</button>
        <button class="yonder-button btn btn-purple m-2" type="button" role="button">purple</button>
        <button class="yonder-button btn btn-indigo m-2" type="button" role="button">indigo</button>
        <button class="yonder-button btn btn-blue m-2" type="button" role="button">blue</button>
        <button class="yonder-button btn btn-cyan m-2" type="button" role="button">cyan</button>
        <button class="yonder-button btn btn-teal m-2" type="button" role="button">teal</button>
        <button class="yonder-button btn btn-green m-2" type="button" role="button">green</button>
        <button class="yonder-button btn btn-yellow m-2" type="button" role="button">yellow</button>
        <button class="yonder-button btn btn-amber m-2" type="button" role="button">amber</button>
        <button class="yonder-button btn btn-orange m-2" type="button" role="button">orange</button>
        <button class="yonder-button btn btn-grey m-2" type="button" role="button">grey</button>
      </div>
---