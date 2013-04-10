$ ->
  gui = new dat.GUI()

$ ->

  iterations = 100000
  chartHeight = 300
  chartWidth  = 300

  rand = ->
    Math.floor Math.random() * 100

  rand2 = ->
    Math.floor (rand() + rand()) / 2

  rand3 = ->
    Math.floor (rand() * rand()) / 100


  rgen = (strategy, len=100, iters=10000)->
    arr = []
    for i in [1..len]
      arr.push 0

    for i in [1..iters]
      arr[strategy()] +=1

    arr

  r = Raphael "chart01"
  r.barchart 0, 0, chartHeight, chartWidth, [rgen(rand, 100, iterations)]

  r = Raphael "chart02"
  r.barchart 0, 0, chartHeight,chartWidth, [rgen(rand2, 100, iterations)]

  r = Raphael "chart03"
  r.barchart 0, 0, chartHeight, chartWidth, [rgen(rand3, 100, iterations)]

    

