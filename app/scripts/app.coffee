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
    if @element?
      @element.remove()

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
    Math.round (rand() + rand() + rand() + rand()) / 4

  rand4 = ->
    Math.round (rand() * rand()) / seriesLength


  chart1 = new Chart rand, 'chart01'
  chart2 = new Chart rand2, 'chart02'
  chart3 = new Chart rand3, 'chart03'
  chart4 = new Chart rand4, 'chart04'

  gui = new dat.GUI()

  f1 = gui.addFolder 'Chart 01 / rand()'
  f1.add(chart1, 'iterations')
    .min(seriesLength)
    .max(seriesLength * 10000)
    .step(seriesLength)
  f1.add(chart1, 'render')

  f2 = gui.addFolder 'Chart 02 / rand() + rand()'
  f2.add(chart2, 'iterations')
    .min(seriesLength)
    .max(seriesLength * 10000)
    .step(seriesLength)
  f2.add(chart2, 'render')

  f3 = gui.addFolder 'Chart 03 / rand() + rand() + rand() + rand()'
  f3.add(chart3, 'iterations')
    .min(seriesLength)
    .max(seriesLength * 10000)
    .step(seriesLength)
  f3.add(chart3, 'render')

  f4 = gui.addFolder 'Chart 04 / rand() * rand()'
  f4.add(chart4, 'iterations')
    .min(seriesLength)
    .max(seriesLength * 10000)
    .step(seriesLength)
  f4.add(chart4, 'render')

