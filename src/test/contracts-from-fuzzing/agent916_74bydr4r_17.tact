struct Coord {
    x: Int as int64;
    y: Int as int64;
}

struct Rectangle {
    topLeft: Coord;
    bottomRight: Coord;
}

contract Test {
    saved: Rectangle;

    init() {
        self.saved = Rectangle{
            topLeft: Coord{ x: 0, y: 0 },
            bottomRight: Coord{ x: 100, y: 100 },
        };
    }
}