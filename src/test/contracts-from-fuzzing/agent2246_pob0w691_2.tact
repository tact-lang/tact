struct Point {
    x: Int;
    y: Int;
}

contract UsesStruct {
    p: Point;

    init() {
        self.p = Point{x: 1, y: 2};
    }
}
