struct Point { x: Int; y: Int }

contract ArrayLike {
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;
    p5: Point;

    init() {
        self.p1 = Point{ x: 1, y: 1 };
        self.p2 = Point{ x: 2, y: 2 };
        self.p3 = Point{ x: 3, y: 3 };
        self.p4 = Point{ x: 4, y: 4 };
        self.p5 = Point{ x: 5, y: 5 };
    }
}