struct Point {
    x: Int;
    y: Int;
}

contract StructFieldTest {
    point: Point;

    init() {
        self.point = Point{ x: 10, y: 20 };
    }
}