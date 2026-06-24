struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract OptionalNested {
    rect: Rectangle?;
    enabled: Bool;

    init() {
        self.rect = Rectangle{
            topLeft: Point{x: 0, y: 1},
            bottomRight: Point{x: 10, y: 11}
        };
        self.enabled = true;
    }
}
