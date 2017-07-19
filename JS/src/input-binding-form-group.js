var formGroupInputBinding = new Shiny.InputBinding();

$.extend(formGroupInputBinding, {
  find: function(scope) {
    return $(scope).find(".dull-form-group[id]");
  },
  getValue: function(el) {
    var $children = $(el).children(".dull-input[id]");

    if (!$children.length) {
      return null;
    }

    return $children
      .map(function(i, e) {
        var ret = {};
        ret[e.id] = $(e).val() || null;
        return ret;
      })
      .get()
      .reduce(function(acc, obj) {
        return Object.assign(acc, obj);
      });
  },
  getState: function(el, data) {
    return { value: this.getValue(el) };
  },
  subscribe: function(el, callback) {
    $(el).on("dull:formchange.formGroupInputBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".formGroupInputBinding");
  },
  receiveMessage: function(el, data) {
    var $el = $(el);

    if (data.state) {
      $el.attr("class", function(i, c) {
        return c.replace(/has-(success|warning|danger)/g, "");
      });
      $el.addClass(data.state);
    }
  }
});

Shiny.inputBindings.register(formGroupInputBinding, "dull.formGroupInput");

$(document).on("shiny:inputchanged", function(e) {
  var $el = $(e.el);

  if ($el.parents(".dull-form[id]").length) {
    var $parent = $el.parents(".dull-form[id]").first();

    if (!$parent.find(".dull-submit[type=\"submit\"]").length) {
      e.preventDefault();

      $parent.trigger("dull:formchange");
    }
  } else if ($el.parents(".dull-form-group[id]").length) {
    e.preventDefault();

    $el
      .parents(".dull-form-group[id]")
      .first()
      .trigger("dull:formchange");
  }
});
