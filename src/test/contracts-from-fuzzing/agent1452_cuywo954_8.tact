struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Point;
    bottomRight: Point;
}

contract RectStorage {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point{ x: 0, y: 0 },
            bottomRight: Point{ x: 1, y: 1 }
        };
    }
}
