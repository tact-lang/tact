struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    point: Point;
    init() {
        self.point = Point{ x: 1, y: 2 };
    }
}