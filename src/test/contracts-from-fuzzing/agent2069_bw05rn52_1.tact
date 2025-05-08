contract TestContract {
    point: Point;

    init() {
        self.point = Point{
            x: 0,
            y: 0,
        };
    }
}

struct Point {
    x: Int;
    y: Int;
}