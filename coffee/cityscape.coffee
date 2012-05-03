# Pass a function to useLayer, and that function will be called, drawing on a particular layer.
useLayer = do ->
    # layers must be registered here, from furthest back to furthest front.
    layerReg = { 
        'sky': new Layer
        'background': new Layer
        'foreground': new Layer
    }
    (layerName) ->
        (fn) ->
            do layerReg[layerName].activate
            do fn

# Return a random color, in hash string form
randColor = ->
    letters = '0123456789ABCDEF'.split ''
    '#' + (letters[Math.round(Math.random() * 15)] for i in [1..6]).join('')

# Return a random number from min to max, inclusive
randNum = (min, max) ->
    Math.floor (Math.random() * (max-min+1)) + min

# Draw the street in the foreground
useLayer('foreground') ->
    street = new Path
    street.strokeColor = 'black'
    street.strokeWidth = 10
    street.add (new Point view.bounds.left, view.bounds.bottom)
    street.add (new Point view.bounds.right, view.bounds.bottom)

# Draw the buildings in the background
useLayer('background') ->
    numbuildings = 150
    for i in [0..numbuildings]
        size = new Size [
            randNum 10, 50
            randNum 20, 120
        ]
        pos = new Point [
            randNum view.bounds.left, view.bounds.right-size.width
            view.bounds.bottom - size.height
        ]
        building = new Path.Rectangle pos, size
        building.strokeColor = 'black'
        building.fillColor = randColor()
        building

# Draw the sunset sky
useLayer('sky') ->
    sky = new Path.Rectangle view.bounds
    skyGrad = new Gradient ['darkblue', 'darkred', 'red']
    sky.fillColor = new GradientColor skyGrad, view.bounds.topCenter, view.bounds.bottomCenter
