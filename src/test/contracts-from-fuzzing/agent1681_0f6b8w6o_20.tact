struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializeExplicit {
    point: Point;

    init() {
        self.point = Point{ x: 42, y: 24 };
    }

    receive() {
        self.point = self.point;
    }
}
