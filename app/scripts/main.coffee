$ ->
  processParams = ->
    url = $.url(window.location.href)
    if url.param "site-url"      
      $ "iframe.screen"
        .attr 'src', url.param "site-url"

      $ "#site-url"
        .val url.param "site-url"

  pushState = ->
    history.pushState "", "", "index.html?#{$("form").serialize()}"

  $ '#site-url'
    .change ->
      pushState()

  processParams()


window.toggleLandscape = (deviceID, caller) ->
  $ deviceID
    .toggleClass 'landscape'

  $ caller 
    .toggleClass 'js-is-landscape'

  if $(caller).hasClass 'js-is-landscape'
    $ caller
      .text 'Portrait'
  else
    $ caller
      .text 'Landscape'