struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerTest {
    p: Point;

    init() {
        self.p = Point{ x:42, y: 24 };
    }
}