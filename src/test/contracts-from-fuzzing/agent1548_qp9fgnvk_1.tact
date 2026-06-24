struct Point {
    x: Int;
    y: Int;
}

contract Test {
    coord: Point;

    init() {
        self.coord = Point{ x:1, y:2 };
    }
}