struct Point {
    x: Int;
    y: Int;
}

contract StructFieldTest {
    pt: Point;

    init() {
        self.pt = Point{ x: 1, y: 2 };
    }

    receive() {
        self.pt = Point{ x: self.pt.x + 1, y: self.pt.y + 1 };
    }
}