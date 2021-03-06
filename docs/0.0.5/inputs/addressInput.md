---
this: addressInput
filename: R/textual.R
layout: page
roxygen:
  title: Address input
  description: |-
    A composite input which includes a street field, apartment or unit field,
    city field, state field, and a zip code field.
  parameters:
  - name: id
    description: A character string specifying the id of the address input.
  - name: '...'
    description: |-
      Additional named arguments passed as HTML attributes to the
      top-level element.
  sections: []
  return: ~
  family: inputs
  name: ~
  rdname: ~
  examples:
  - type: markdown
    value: |
      <h3>Default fields</h3>
  - type: source
    value: |2-

      addressInput(id = "mailing")
  - type: output
    value: |-
      <div class="yonder-address" id="mailing">
        <div class="form-group">
          <label for="address-339-572" class="col-form-label">Address</label>
          <input type="text" class="form-control" id="address-339-572" placeholder="Street address, P.O. box"/>
        </div>
        <div class="form-group">
          <label for="address-826-527" class="form-control-label sr-only">Address line 2</label>
          <input type="text" class="form-control" id="address-826-527" placeholder="Apartment, floor, unit"/>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6 mt-auto">
            <label class="form-control-label" for="address-606-198">City</label>
            <input type="text" class="form-control" id="address-606-198"/>
          </div>
          <div class="form-group col-md-3">
            <label class="form-control-label" for="address-60-916">State</label>
            <input type="text" class="form-control" id="address-60-916"/>
          </div>
          <div class="form-group col-md-3 mt-auto">
            <label class="form-control-label" for="address-385-858">Zip</label>
            <input type="text" class="form-control" id="address-385-858"/>
          </div>
        </div>
      </div>
---
