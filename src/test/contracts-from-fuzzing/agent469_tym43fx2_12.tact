struct Point {
    x: Int as uint32;
    y: Int as uint32;
}

contract SerializeTest {
    p: Point;

    init() {
        self.p = Point{ x: 1, y: 2 };
    }
}