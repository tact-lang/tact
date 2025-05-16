struct Point { x: Int; y: Int; }

contract Simple {
    pos: Point;

    init() {
        self.pos = Point{ x: 1, y: 2 };
    }
}