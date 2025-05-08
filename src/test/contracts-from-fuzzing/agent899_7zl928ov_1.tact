contract Test {
    point: Point;

    init() {
        self.point = Point{ x: 5, y: 10 };
    }
}

struct Point {
    x: Int;
    y: Int;
}