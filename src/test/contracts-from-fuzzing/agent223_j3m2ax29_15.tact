struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract WithSerializationHints {
    p: Point;

    init() {
        self.p = Point{x: 10, y: 20};
    }
}