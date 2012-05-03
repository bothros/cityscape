randColor = () ->
    letters = '0123456789ABCDEF'.split ''
    '#' + (letters[Math.round(Math.random() * 15)] for i in [1..6]).join('')

randNum = (min, max) ->
    Math.floor (Math.random() * (max-min+1)) + min

drawForeGround = () ->
    foreground = new Layer

    street = new Path
    street.strokeColor = 'black'
    street.strokeWidth = 10
    street.add (new Point view.bounds.left, view.bounds.bottom)
    street.add (new Point view.bounds.right, view.bounds.bottom)

    foreground

drawBackGround = () ->
    background = new Layer

    numbuildings = 150
    buildings = for i in [0..numbuildings]
        size = new Size [
            #Math.floor (Math.random() * 21) + 5
            randNum 10, 50
            #Math.floor (Math.random() * 51) + 10
            randNum 20, 120
        ]
        pos = new Point [
            #Math.floor (Math.random() * (view.bounds.width-size.width)) + view.bounds.left
            randNum view.bounds.left, view.bounds.right-size.width
            view.bounds.bottom - size.height
        ]
        building = new Path.Rectangle pos, size
        building.strokeColor = 'black'
        building.fillColor = randColor()
        building
    
    background

drawSky = () ->
    background = new Layer

    sky = new Path.Rectangle view.bounds
    skyGrad = new Gradient ['darkblue', 'darkred', 'red']
    sky.fillColor = new GradientColor skyGrad, view.bounds.topCenter, view.bounds.bottomCenter

    background

drawSky()
drawBackGround()
drawForeGround()
