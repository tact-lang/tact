struct Point {
    x: Int as int32;
    y: Int as int32;
}

contract SerializationTest {
    coord1: Point;
    coord2: Point;
    bigval: Int as int257;

    init() {
        self.coord1 = Point{ x: 100, y: 200 };
        self.coord2 = Point{ x: -50, y: -60 };
        self.bigval = 1234567890123456789;
    }
}
