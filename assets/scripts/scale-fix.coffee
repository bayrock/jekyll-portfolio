---
---

do (document) ->
  metas = document.getElementsByTagName('meta')

  changeViewportContent = (content) ->
    i = 0
    while i < metas.length
      if metas[i].name == 'viewport'
        metas[i].content = content
      i++
    return

  initialize = ->
    changeViewportContent 'width=device-width, minimum-scale=1.0, maximum-scale=1.0'
    return

  gestureStart = ->
    changeViewportContent 'width=device-width, minimum-scale=0.25, maximum-scale=1.6'
    return

  gestureEnd = ->
    initialize()
    return

  if navigator.userAgent.match(/iPhone/i)
    initialize()
    document.addEventListener 'touchstart', gestureStart, false
    document.addEventListener 'touchend', gestureEnd, false
  return
  