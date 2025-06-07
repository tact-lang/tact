struct Point {
    x: Int as int32;
    y: Int as int32;
}

contract SerializationTest {
    pt: Point;
    init() {
        self.pt = Point{ x: 123, y: -456 };
    }
}