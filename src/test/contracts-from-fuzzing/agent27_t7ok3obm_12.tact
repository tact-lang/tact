struct Point {
    x: Int as int8;
    y: Int as int8;
}

contract SerializedFields {
    point: Point;

    init() {
        self.point = Point{ x: 100, y: 50 };
    }
}
