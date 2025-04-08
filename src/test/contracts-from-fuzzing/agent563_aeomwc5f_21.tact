struct Coord {
    x: Int as int64;
    y: Int as int64;
}

struct Box {
    p1: Coord;
    p2: Coord;
}

contract NestedSerialized {
    rect: Box;

    init() {
        self.rect = Box{
            p1: Coord{ x: 1, y: 2 },
            p2: Coord{ x: 3, y: 4 }
        };
    }
}