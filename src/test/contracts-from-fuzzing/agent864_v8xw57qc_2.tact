struct Point {
    x: Int;
    y: Int;
}

contract Bar {
    pt: Point;
    init() {
        self.pt = Point{ x: 1, y: 2 };
    }

    receive() {
        self.pt = Point{ x: 3, y: 4 };
    }
}