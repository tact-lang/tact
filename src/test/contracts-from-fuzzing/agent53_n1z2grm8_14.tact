struct Point {
    x: Int;
    y: Int;
}

struct Circle {
    center: Point;
    radius: Int;
}

contract Geometry {
    p: Point;
    c: Circle;

    init() {
        self.p = Point{ x: 1, y: 2 };
        self.c = Circle{ center: self.p, radius: 5 };
    }
}