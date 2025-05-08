struct Point {
    x: Int;
    y: Int;
}

contract A {
    pt: Point;

    init() {
        self.pt = Point{x: 1, y: 2};
    }
}