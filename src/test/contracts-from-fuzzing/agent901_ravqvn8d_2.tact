struct Point {
    x: Int;
    y: Int;
    z: Int?;
}

contract StructFieldTest {
    p: Point;

    init() {
        self.p = Point{ x:1, y:2, z: null };
    }
}