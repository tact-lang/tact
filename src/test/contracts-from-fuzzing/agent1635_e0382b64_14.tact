struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializedFields {
    location: Point;

    init() {
        self.location = Point{x: 10, y: 20};
    }
}
