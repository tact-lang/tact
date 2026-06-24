struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract ShapeStorage {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point{x:-100, y:100},
            bottomRight: Point{x:100, y:-100}
        };
    }
}