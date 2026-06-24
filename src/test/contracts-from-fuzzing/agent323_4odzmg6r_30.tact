struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract Test {
    pos: Point;

    init() {
        self.pos = Point{
            x: 100,
            y: -100,
        };
    }
}