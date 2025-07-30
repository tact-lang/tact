struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    pt: Point = Point{x: 1, y: 2};

    init() {
        self.pt = Point{x: 3, y: 4};
    }
}
