struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializationTest {
    point: Point;

    init() {
        self.point = Point{ x: 123, y: 456 };
    }
}