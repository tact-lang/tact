struct Point { x: Int; y: Int; }

contract ArrayLike {
    p1: Point;
    p2: Point;
    p3: Point;

    init() {
        self.p1 = Point{x:1,y:1};
        self.p2 = Point{x:2,y:2};
        self.p3 = Point{x:3,y:3};
    }
}