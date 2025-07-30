struct Point {
    x: Int = 0;
    y: Int = 0;
}

contract StructFieldTest {
    location: Point = Point{ x: 10, y: 20 };

    init() {
        self.location = Point{ x: 100, y: 200 };
    }
}