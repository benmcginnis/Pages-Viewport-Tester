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


$ ".js-change-orientation"
  .click () ->
    $self = $ @
    deviceSelector = $self.data().deviceSelector
    
    $ deviceSelector
      .toggleClass 'landscape'
    
    $self.toggleClass 'js-is-landscape'
    
    if $self.hasClass 'js-is-landscape'
      $self.text 'Portrait'
    else
      $self.text 'Landscape'