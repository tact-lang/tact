struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializeEdge {
    p: Point;

    init() {
        self.p = Point{x: 1, y: -1};
    }
}