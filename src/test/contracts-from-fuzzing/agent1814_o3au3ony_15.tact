struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract TestRect {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point{x: 0, y: 10},
            bottomRight: Point{x: 5, y: 0}
        };
    }
}
