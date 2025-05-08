struct Point { x: Int; y: Int; }

contract MinimalNested {
    position: Point;

    init() {
        self.position = Point{ x: 1, y: 2 };
    }
}