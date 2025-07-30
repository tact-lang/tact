struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerialTest {
    pt: Point;

    init() {
        self.pt = Point{
            x: -100,
            y: 100
        };
    }
}
