origin = new Point 0, 0
size = new Size 10, 10

rect = new Path.Rectangle origin, size
rect.fillColor = 'red'

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
        Math.floor (Math.random() * 21) + 5
        Math.floor (Math.random() * 51) + 10
    ]
    pos = new Point [
        Math.floor (Math.random() * view.bounds.width-size.width) + view.bounds.left
        view.bounds.bottom - size.height
    ]
    building = new Path.Rectangle pos, size
    building.strokeColor = 'black'
    building.fillColor = 'blue'
    building
