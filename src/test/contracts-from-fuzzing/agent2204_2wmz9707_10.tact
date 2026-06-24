struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Rectangle {
    p1: Point;
    p2: Point;
}

contract Geometry {
    shape: Rectangle;
    init() {
        self.shape = Rectangle{
            p1: Point{ x: 0, y: 0 },
            p2: Point{ x: 100, y: 100 }
        };
    }
}