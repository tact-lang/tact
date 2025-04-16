struct Point { x: Int; y: Int; }
struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}
struct Canvas {
    rect1: Rectangle;
    rect2: Rectangle;
}

contract MultiNested {
    picture: Canvas;

    init() {
        self.picture = Canvas{
            rect1: Rectangle{ topLeft: Point{ x:0, y:0 }, bottomRight: Point{ x:10, y:10 } },
            rect2: Rectangle{ topLeft: Point{ x:5, y:5 }, bottomRight: Point{ x:15, y:15 } }
        };
    }
}