struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    coord: Point;

    init() {
        self.coord = Point{ x: 1, y: 2 };
    }
}