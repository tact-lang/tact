struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract HasPoint {
    pos: Point;
    init() {
        self.pos = Point{ x: 1, y: 2 };
    }
}