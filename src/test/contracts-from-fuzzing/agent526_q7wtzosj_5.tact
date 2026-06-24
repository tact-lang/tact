struct Point {
    x: Int;
    y: Int;
}

contract ArrayLike {
    p0: Point;
    p1: Point;
    p2: Point;
    p3: Point;
    p4: Point;

    init() {
        self.p0 = Point{x: 1, y: 2};
        self.p1 = Point{x: 3, y: 4};
        self.p2 = Point{x: 5, y: 6};
        self.p3 = Point{x: 7, y: 8};
        self.p4 = Point{x: 9, y: 10};
    }
}
