struct Point {
    x: Int as int32;
    y: Int as int32;
}

contract SerializeFieldTest {
    pos: Point;

    init() {
        self.pos = Point{ x: 100, y: -100 };
    }
}