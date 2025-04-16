struct Point {
    x: Int;
    y: Int;
}

contract OptionalArrayLike {
    p1: Point?;
    p2: Point?;
    p3: Point?;

    init() {
        self.p1 = null;
        self.p2 = Point{x:0, y:0};
        self.p3 = null;
    }
}