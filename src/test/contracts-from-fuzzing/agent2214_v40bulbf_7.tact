struct Point {
    x: Int;
    y: Int;
}

struct Circle {
    center: Point;
    radius: Int;
}

contract NestedOptional {
    circ: Circle?;

    init() {
        self.circ = null;
    }
}