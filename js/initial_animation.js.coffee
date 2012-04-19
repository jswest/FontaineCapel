$ ->
  window.rotate = ( x ) ->
    $('#loading-sign').css(
      '-webkit-transform': 'rotate(' + x + 'deg)'
      '-moz-transform': 'rotate(' + x + 'deg)'
      '-ms-transform': 'rotate(' + x + 'deg)'
      'o-transform': 'rotate(' + x + 'deg)'
      'transform': 'rotate(' + x + 'deg)'
    )  
  window.auto = ( x ) ->
    if $('#loading-sign').length > 0
      window.rotate( x )
      x++
      t = setTimeout( =>
        window.auto( x )
      ,1 )
    else
      clearTimeout( t )
  
  
  $('li#two_dimensions').addClass('current')
  div = $('#nav-and-header-control')
  div.html('')
  div.append('<div id="loading-sign"></div>')  
  window.auto( 1 ) 
  
  $.ajax
    dataType: 'html'
    method: 'POST'
    url: "_two_dimensions.html"
    success: (data) ->
      $('#content').html( data )
      $('section#content').fadeIn(
        5000
        ->
          $('#nav-and-header').slideToggle(
            'slow'
            ->
              $('#nav-and-header-control').html('')
              div.append('<div id="up-sign"></div>')
          )
      )


      
    
  
