struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract WithSerialization {
    coord: Point;

    init() {
        self.coord = Point { x: 100, y: -100 };
    }
}