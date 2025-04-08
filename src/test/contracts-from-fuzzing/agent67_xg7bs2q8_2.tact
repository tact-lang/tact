struct Point {
    x: Int;
    y: Int;
}

contract StructInState {
    p: Point;

    init() {
        self.p = Point{x: 1, y: 2};
    }
}
