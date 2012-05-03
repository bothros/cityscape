// Generated by CoffeeScript 1.3.2-pre
(function() {
  var background, building, buildings, foreground, i, numbuildings, origin, pos, randColor, randNum, rect, size, street;

  origin = new Point(0, 0);

  size = new Size(10, 10);

  rect = new Path.Rectangle(origin, size);

  rect.fillColor = 'red';

  randColor = function() {
    var i, letters;
    letters = '0123456789ABCDEF'.split('');
    return '#' + ((function() {
      var _i, _results;
      _results = [];
      for (i = _i = 0; _i <= 6; i = ++_i) {
        _results.push(letters[Math.round(Math.random() * 15)]);
      }
      return _results;
    })()).join('');
  };

  randNum = function(min, max) {
    return Math.floor((Math.random() * (max - min + 1)) + min);
  };

  foreground = project.activeLayer;

  street = new Path;

  street.strokeColor = 'black';

  street.strokeWidth = 10;

  street.add(new Point(view.bounds.left, view.bounds.bottom));

  street.add(new Point(view.bounds.right, view.bounds.bottom));

  background = new Layer;

  background.moveBelow(foreground);

  numbuildings = 150;

  buildings = (function() {
    var _i, _results;
    _results = [];
    for (i = _i = 0; 0 <= numbuildings ? _i <= numbuildings : _i >= numbuildings; i = 0 <= numbuildings ? ++_i : --_i) {
      size = new Size([randNum(5, 25), randNum(10, 60)]);
      pos = new Point([randNum(view.bounds.left, view.bounds.right - size.width), view.bounds.bottom - size.height]);
      building = new Path.Rectangle(pos, size);
      building.strokeColor = 'black';
      building.fillColor = randColor();
      console.log(building.fillColor);
      _results.push(building);
    }
    return _results;
  })();

  console.log(randColor());

}).call(this);
