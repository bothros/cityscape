origin = new Point 0, 0
size = new Size 10, 10

rect = new Path.Rectangle origin, size
rect.fillColor = 'red'

randColor = () ->
    letters = '0123456789ABCDEF'.split ''
    '#' + (letters[Math.round(Math.random() * 15)] for i in [0..6]).join('')

randNum = (min, max) ->
    Math.floor (Math.random() * (max-min+1)) + min

foreground = project.activeLayer

street = new Path
street.strokeColor = 'black'
street.strokeWidth = 10
street.add (new Point view.bounds.left, view.bounds.bottom)
street.add (new Point view.bounds.right, view.bounds.bottom)

background = new Layer
background.moveBelow foreground

numbuildings = 150
buildings = for i in [0..numbuildings]
    size = new Size [
        #Math.floor (Math.random() * 21) + 5
        randNum 5, 25
        #Math.floor (Math.random() * 51) + 10
        randNum 10, 60
    ]
    pos = new Point [
        #Math.floor (Math.random() * (view.bounds.width-size.width)) + view.bounds.left
        randNum view.bounds.left, view.bounds.right-size.width
        view.bounds.bottom - size.height
    ]
    building = new Path.Rectangle pos, size
    building.strokeColor = 'black'
    building.fillColor = randColor()
    console.log building.fillColor
    building
