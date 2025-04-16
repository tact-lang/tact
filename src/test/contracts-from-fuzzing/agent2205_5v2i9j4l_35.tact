struct Point {
    x: Int;
    y: Int;
}

struct Circle {
    center: Point;
    radius: Int;
}

struct ShapeOpt {
    circ: Circle?;
}

contract GeometryOpt {
    s: ShapeOpt;
    init() {
        self.s = ShapeOpt{ circ: null };
    }
}