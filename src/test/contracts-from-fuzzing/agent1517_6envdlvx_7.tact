struct Point { x: Int; y: Int; }

contract StructField {
    pos: Point;
    init() {
        self.pos = Point{ x: 7, y: 11 };
    }
}