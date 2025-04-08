struct Point {
    x: Int;
    y: Int;
}

contract ArraySim {
    p1: Point;
    p2: Point;
    p3: Point;

    init() {
        self.p1 = Point{ x:1, y:2 };
        self.p2 = Point{ x:3, y:4 };
        self.p3 = Point{ x:5, y:6 };
    }
}
