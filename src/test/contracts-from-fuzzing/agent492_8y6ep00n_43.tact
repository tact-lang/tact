struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract Test {
    p1: Point;
    p2: Point;

    init() {
        self.p1 = Point{x:1,y:2};
        self.p2 = Point{x:3,y:4};
    }
}