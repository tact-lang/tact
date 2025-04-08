struct Point { x: Int; y: Int; }

contract ArrayLike {
    p1: Point = Point{x:1,y:2};
    p2: Point = Point{x:3,y:4};
    p3: Point = Point{x:5,y:6};

    init() {
        self.p2 = Point{x:30, y:40};
    }
}
