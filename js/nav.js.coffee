$ ->
  $('#nav-and-header-control').click ->
    $('#nav-and-header').slideToggle(
      'slow'
      ->
        console.log $('#up-sign').length > 0
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
    $('#nav-and-header-control').html('')
    $('#nav-and-header-control').append('<div id="loading-sign"></div>')
    window.auto( 1 )
    ajax_url = "_#{$(this).attr('id')}.html"
    $.ajax
      dataType: 'html'
      method: 'POST'
      url: ajax_url
      success: (data) ->
        $('#content').fadeOut(
         ->
          lis.removeClass( 'current' )
          $("##{this_li_id}").addClass('current')
          $('#content').html( data )
          last_img = $('#content').find('img').eq(-1)
          console.log "loading"
          last_img.load ->
            $('#content').fadeIn(
              5000
              ->
                $('#nav-and-header-control').html('')
                $('#nav-and-header-control').append('<div id="up-sign"></div>')
                window.lightbox()
            )
        )
          