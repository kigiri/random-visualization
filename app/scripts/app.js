var Chart, seriesLength;

seriesLength = 100;

Chart = (function() {
  Chart.prototype.chartWidth = 300;

  Chart.prototype.chartHeight = 300;

  Chart.prototype.length = seriesLength;

  Chart.prototype.iterations = 100000;

  Chart.prototype.paper = null;

  Chart.prototype.element = null;

  function Chart(strategy, domId) {
    this.strategy = strategy;
    this.domId = domId;
    this.paper = Raphael(this.domId);
    this.render();
  }

  Chart.prototype.render = function() {
    if (this.element != null) {
      this.element.remove;
    }
    return this.element = this.paper.barchart(0, 0, this.chartHeight, this.chartWidth, [this.rgen()]);
  };

  Chart.prototype.rgen = function() {
    var arr, i, j, k, ref, ref1;
    arr = [];
    for (i = j = 1, ref = this.length; 1 <= ref ? j <= ref : j >= ref; i = 1 <= ref ? ++j : --j) {
      arr.push(0);
    }
    for (i = k = 1, ref1 = this.iterations; 1 <= ref1 ? k <= ref1 : k >= ref1; i = 1 <= ref1 ? ++k : --k) {
      arr[this.strategy()] += 1;
    }
    return arr;
  };

  return Chart;

})();

$(function() {
  var chart, charts, gui, j, len, rand, rand2, rand3, rand4, results;
  rand = function() {
    return Math.floor(Math.random() * seriesLength);
  };
  rand2 = (s => () => Math.floor((s = (s * Math.PI + 0.534) % 1) * seriesLength))(424242)
  rand3 = (s => () => Math.floor((s = (s * (22 / 3.3) + 0.534) % 1) * seriesLength))(424242)
  rand4 = (s => () => Math.floor((s = (s * 2153.333 + 0.534) % 1) * seriesLength))(424242)
  charts = [new Chart(rand, 'chart01'), new Chart(rand2, 'chart02'), new Chart(rand3, 'chart03'), new Chart(rand4, 'chart04')];
  gui = new dat.GUI();
  results = [];
  for (j = 0, len = charts.length; j < len; j++) {
    chart = charts[j];
    results.push((function(chart) {
      var folder;
      folder = gui.addFolder("Chart " + chart.domId);
      folder.add(chart, 'iterations').min(seriesLength).max(seriesLength * 10000).step(seriesLength);
      return folder.add(chart, 'render');
    })(chart));
  }
  return results;
});

// ---
// generated by coffee-script 1.9.2
