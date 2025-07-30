struct Point {
    x: Int;
    y: Int;
}

struct Circle {
    center: Point;
    radius: Int;
}

contract ShapeStorage {
    shape: Circle = Circle{ center: Point{ x: 0, y: 0 }, radius: 5 };
}