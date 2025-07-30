struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializeDiff {
    p: Point;

    init() {
        self.p = Point{ x:1, y:2 };
    }
}