struct Point {
    x: Int;
    y: Int;
    label: String;
}

struct Rectangle {
    p1: Point;
    p2: Point;
    caption: String;
}

contract TestContract {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            p1: Point{x: 0, y: 0, label: "A"},
            p2: Point{x: 10, y: 10, label: "B"},
            caption: "Square"
        };
    }
}