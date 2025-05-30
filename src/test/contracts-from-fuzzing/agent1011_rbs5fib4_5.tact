struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract SerializationFormatsTest {
    pt: Point;

    init() {
        self.pt = Point{
            x: 10,
            y: 20,
        };
    }
}