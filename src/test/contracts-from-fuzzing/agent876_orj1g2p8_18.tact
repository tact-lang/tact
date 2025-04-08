struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializedStructFields {
    position: Point;

    init() {
        self.position = Point{ x: 123, y: 456 };
    }
}