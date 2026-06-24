struct Point {
    x: Int;
    y: Int;
}

struct Triangle {
    a: Point;
    b: Point;
    c: Point;
}

contract ShapeTest {
    tri: Triangle;

    init() {
        self.tri = Triangle{
            a: Point{ x: 0, y: 0 },
            b: Point{ x: 1, y: 0 },
            c: Point{ x: 0, y: 1 }
        };
    }
}