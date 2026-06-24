struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    position: Point;

    init() {
        self.position = Point{ x: 10, y: 20 };
    }
}