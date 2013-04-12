seriesLength = 100

class Chart

  chartWidth  : 300
  chartHeight : 300
  length      : seriesLength
  iterations  : 100000
  paper       : null
  element     : null

  constructor : (@strategy, @domId)->
    @paper = Raphael @domId
    @render()

  render : ->
    @element.remove if @element?

    @element = @paper.barchart 0, 0, @chartHeight, @chartWidth,
      [@rgen()]

  rgen : ->
    arr = []
    for i in [1..@length]
      arr.push 0
    for i in [1..@iterations]
      arr[@strategy()] +=1
    arr

$ ->

  rand = ->
    Math.floor Math.random() * seriesLength

  rand2 = ->
    Math.round (rand() + rand()) / 2

  rand3 = ->
    Math.round (rand2() + rand2()) / 2

  rand4 = ->
    Math.round (rand() * rand()) / seriesLength

  charts = [
    new Chart rand, 'chart01'
    new Chart rand2, 'chart02'
    new Chart rand3, 'chart03'
    new Chart rand4, 'chart04'
  ]

  gui = new dat.GUI()

  for chart in charts
    folder = gui.addFolder "Chart #{chart.domId}"
    folder.add(chart, 'iterations')
      .min(seriesLength)
      .max(seriesLength * 10000)
      .step(seriesLength)
    folder.add(chart, 'render')

