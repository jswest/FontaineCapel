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
  
  column1 = $("<div class='column' id='column1'></div>")
  column2 = $("<div class='column' id='column2'></div>")
  column3 = $("<div class='column' id='column3'></div>")
  $('#content').append(column1)
  $('#content').append(column2)
  $('#content').append(column3)
  
  numImages = 19
  folder = 'two_dimensions'
  for i in [1..numImages]
    img = $("<img />")
    img.attr('src', "images/#{folder}/#{i}.jpg")
    $('#column1').append(img) if i < numImages / 3
    $('#column2').append(img) if i >= numImages / 3 and i <= (numImages * 2) / 3
    $('#column3').append(img) if i > (numImages * 2) / 3
    img.load ->
      $(this).fadeIn(
        5000
        ->
          $('#nav-and-header-control').html('')
          $('#nav-and-header-control').append('<div id="up-sign"></div>')
      )
  $('#nav-and-header').slideToggle('slow')
  
    