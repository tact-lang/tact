struct Coord {
    x: Int as int64;
    y: Int as int64;
}

struct Rect {
    topLeft: Coord;
    bottomRight: Coord;
}

contract NestedSized {
    rect: Rect;

    init() {
        self.rect = Rect{
            topLeft: Coord{x:0,y:0},
            bottomRight: Coord{x:100,y:100}
        };
    }
}