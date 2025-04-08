struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    pos: Point;

    init() {
        self.pos = Point{ x: 10, y: 20 };
    }
}