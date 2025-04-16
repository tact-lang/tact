struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializedInts {
    p: Point;

    init() {
        self.p = Point{
            x: 123,
            y: 456,
        };
    }
}