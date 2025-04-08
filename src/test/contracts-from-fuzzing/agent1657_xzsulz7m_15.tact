struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract CoordinateStorage {
    p: Point;
    init() {
        self.p = Point{x: 123456789, y: -123456789};
    }
}