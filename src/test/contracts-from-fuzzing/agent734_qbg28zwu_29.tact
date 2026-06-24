struct Point {
    x: Int = 0;
    y: Int = 0;
}

contract TestContract {
    p1: Point = Point{};
    p2: Point;

    init() {
        self.p2 = Point{ x: 5, y: 7 };
    }
}