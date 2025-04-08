struct Point {
    x: Int;
    y: Int;
}

contract StructField {
    pos: Point = Point{x: 1, y: 2};

    init() {
        self.pos = Point{x: 3, y: 4};
    }
}