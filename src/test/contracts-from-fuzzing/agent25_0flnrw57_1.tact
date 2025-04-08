struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    point: Point;

    init() {
        self.point = Point{x: 10, y: 20};
    }
}