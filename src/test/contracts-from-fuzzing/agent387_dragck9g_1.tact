struct Point {
    x: Int;
    y: Int;
}

contract NestedStruct {
    p: Point;
    init() {
        self.p = Point{x: 1, y: 2};
    }
}
