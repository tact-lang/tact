struct Point {
    x: Int as int32;
    y: Int as int32;
}

contract SerializationTest {
    p: Point;

    init() {
        self.p = Point{ x: 123, y: 456 };
    }
}