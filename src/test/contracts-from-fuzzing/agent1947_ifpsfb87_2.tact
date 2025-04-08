struct Point {
    x: Int;
    y: Int?;
}

contract NestedOptional {
    p: Point;
    init() {
        self.p = Point{
            x: 5,
            y: null,
        };
    }
}