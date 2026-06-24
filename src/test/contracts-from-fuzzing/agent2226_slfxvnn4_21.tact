struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract Coordinates {
    p1: Point;
    p2: Point;
    init() {
        self.p1 = Point{ x: 100, y: 200 };
        self.p2 = Point{ x: -1000, y: 500 };
    }
}
