struct Point {
    x: Int;
    y: Int;
}

contract DefaultStructFields {
    p: Point = Point{x: 11, y: 22};

    init() {
        self.p = Point{x: 4, y: 5};
    }
}