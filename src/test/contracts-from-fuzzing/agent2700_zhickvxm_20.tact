struct Coord {
    x: Int;
    y: Int;
}

contract CoordOpts {
    pos1: Coord?;
    pos2: Coord?;

    init() {
        self.pos1 = null;
        self.pos2 = null;
    }
}