$ ->
  window.lightbox = () ->  
    $('#lightbox-gloss').click ->
      $(this).hide()
      $('#img-lightbox-wrapper').hide()
    $('section#content').find('img').click ->
      $('#lightbox-gloss').show()
      $('#img-lightbox-wrapper').show()
      ajax_url = $(this).attr('src')
      $.ajax
        url: ajax_url
        success: (data) ->
          $('#img-lightbox-wrapper').html("<img src='#{ajax_url}' />")
  window.lightbox()
    