struct Point { x: Int; y: Int; }

contract SingleStructField {
    coords: Point;

    init() {
        self.coords = Point{ x: 1, y: 2 };
    }
}
