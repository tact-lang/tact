struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    coords: Point;

    init() {
        self.coords = Point{ x: 10, y: 20 };
    }
}