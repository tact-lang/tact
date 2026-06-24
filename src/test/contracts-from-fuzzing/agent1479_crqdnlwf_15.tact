struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
    label: String?;
}

contract Test {
    box: Rectangle;
    init() {
        self.box = Rectangle {
            topLeft: Point { x: 0, y: 10 },
            bottomRight: Point { x: 20, y: 0 },
            label: null
        };
    }
}