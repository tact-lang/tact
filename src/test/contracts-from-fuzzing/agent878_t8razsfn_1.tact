struct Point {
    x: Int;
    y: Int;
}

contract Test {
    p: Point;

    init() {
        self.p = Point{ x: 7, y: 8 };
    }
}