struct Point2D {
    x: Int as int64;
    y: Int as int64;
}

struct Rectangle {
    topLeft: Point2D;
    bottomRight: Point2D;
}

contract Rectangles {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point2D{ x:0, y:1 },
            bottomRight: Point2D{ x:10, y:20 }
        };
    }
}