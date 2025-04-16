struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Circle {
    center: Point;
    radius: Int as uint32;
}

contract NestedSerialization {
    circ: Circle;

    init() {
        self.circ = Circle{
            center: Point{ x: 10, y: 20 },
            radius: 100
        };
    }
}