struct Point {
    x: Int;
    y: Int;
}

contract StructAsField {
    pt: Point;

    init() {
        self.pt = Point{
            x: 10,
            y: 20
        };
    }
}
