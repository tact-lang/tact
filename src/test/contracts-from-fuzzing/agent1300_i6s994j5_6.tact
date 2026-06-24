struct Point { x: Int; y: Int; }

contract InitStructField {
    pos: Point;

    init() {
        self.pos = Point{ x: 10, y: 20 };
    }
}