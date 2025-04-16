struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
    name: String;
}

contract ShapeHolder {
    shape: Rectangle;
    init() {
        self.shape = Rectangle{
            topLeft: Point{x: 0, y: 10},
            bottomRight: Point{x: 10, y: 0},
            name: "MyRect"
        };
    }
}