struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract NestedGeometry {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point { x:0, y:10 },
            bottomRight: Point { x:10, y:0 }
        };
    }
}