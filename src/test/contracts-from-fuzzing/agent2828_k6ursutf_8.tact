struct Point {
    x: Int = 1;
    y: Int = 2;
}

contract StructField {
    p: Point;

    init() {
        self.p = Point{};
    }
}