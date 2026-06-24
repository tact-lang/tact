struct Point {
    x: Int;
    y: Int;
}

contract DefaultNested {
    val: Point = Point{x: 0, y: 0};

    init() {
        self.val = Point{x: 5, y: -3};
    }
}