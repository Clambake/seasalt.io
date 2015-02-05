$(".js-menu-open").bind "click", (e) ->
  $(".hdr").addClass "hdr-menu-open"

$(".js-menu-close").bind "click", (e) ->
  $(".hdr").removeClass "hdr-menu-open"
