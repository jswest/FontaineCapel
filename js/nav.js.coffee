$ ->
  $('#nav-and-header-control').click ->
    $('#nav-and-header').slideToggle(
      'slow'
      ->
        if $('#up-sign').length > 0
          $('#nav-and-header-control').html('')
          $('#nav-and-header-control').append('<div id="down-sign"></div>')
        else
          $('#nav-and-header-control').html('')
          $('#nav-and-header-control').append('<div id="up-sign"></div>')
    )

  lis = $('nav#primary-nav').find('li')
  lis.click ->
    this_li_id = $(this).attr('id')
    li = $(this)
    $('#nav-and-header-control').html('')
    $('#nav-and-header-control').append('<div id="loading-sign"></div>')
    window.auto( 1 )
    $('#content').fadeOut(
      1000
      ->
        console.log "fade out"
        $('#content').html('')
        $('#content').show()
        column1 = $("<div class='column' id='column1'></div>")
        column2 = $("<div class='column' id='column2'></div>")
        column3 = $("<div class='column' id='column3'></div>")
        $('#content').append(column1)
        $('#content').append(column2)
        $('#content').append(column3)
        numImages = li.data('num-images')
        console.log numImages
        folder = this_li_id
        for i in [1..numImages + 1]
          console.log "loop #{i}"
          img = $("<img />")
          img.attr('src', "images/#{folder}/#{i}.jpg")
          $('#column1').append(img) if i < numImages / 3
          $('#column2').append(img) if i >= numImages / 3 and i <= (numImages * 2) / 3
          $('#column3').append(img) if i > (numImages * 2) / 3
          img.load ->
            console.log "image #{i} loaded"
            $(this).fadeIn(
              5000
              ->
                  window.lightbox()
                  $('#nav-and-header-control').html('')
                  $('#nav-and-header-control').append('<div id="up-sign"></div>')
                  lis.removeClass( 'current' )
                  $("##{this_li_id}").addClass('current')
            )
    )