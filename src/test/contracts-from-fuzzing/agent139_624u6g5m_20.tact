struct Point {
    x: Int;
    y: Int;
}

contract DefaultStructValue {
    coord: Point = Point{ x: 10, y: 20 };

    init() {
        self.coord = Point{ x: 5, y: 15 };
    }
}