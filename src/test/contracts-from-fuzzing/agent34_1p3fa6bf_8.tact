struct Point {
    x: Int;
    y: Int;
}

contract Test7 {
    p: Point;
    init() {
        self.p = Point{ x: 1, y: 2 };
    }
}