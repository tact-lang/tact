struct Point {
    x: Int;
    y: Int;
}

contract OptionalStructFields {
    point1: Point?;
    point2: Point?;

    init() {
        self.point1 = Point{ x: 1, y: 2 };
        self.point2 = null;
    }
}