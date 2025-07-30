struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract Geometry {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point{ x: 0, y: 0 },
            bottomRight: Point{ x: 100, y: 100 },
        };
    }
}