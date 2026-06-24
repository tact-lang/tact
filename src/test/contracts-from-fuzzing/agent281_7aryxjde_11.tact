struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract TestSerialize {
    p: Point;

    init() {
        self.p = Point{ x: 1000, y: -1000 };
    }
}