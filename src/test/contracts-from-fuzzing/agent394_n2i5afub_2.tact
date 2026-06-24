struct Point {
    x: Int = 0;
    y: Int = 0;
}

contract TestContract {
    pt: Point;

    init() {
        self.pt = Point{ x: 5, y: 7 };
    }
}