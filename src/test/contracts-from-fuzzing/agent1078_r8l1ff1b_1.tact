struct Point { x: Int; y: Int; }

contract Simple {
    position: Point;

    init() {
        self.position = Point{ x: 1, y: 2 };
    }
}