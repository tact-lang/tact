struct Coord2D {
    x: Int as int128;
    y: Int as int128;
}

struct Wrapper {
    coord: Coord2D;
}

contract BigIntegers {
    pos: Wrapper;
    init() {
        self.pos = Wrapper{
            coord: Coord2D{ x: 123, y: 456 }
        };
    }
}