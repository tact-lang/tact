struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract PointInState {
    p: Point;

    init() {
        self.p = Point{x:0,y:0};
    }
}
