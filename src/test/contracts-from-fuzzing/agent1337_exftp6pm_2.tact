struct Point {
    x: Int;
    y: Int;
}

contract StructFieldContract {
    p: Point;

    init() {
        self.p = Point{ x: 7, y: 42 };
    }
}