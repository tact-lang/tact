struct Coord {
    x: Int as int64;
    y: Int as int64;
    z: Int?;
}

contract CoordStore {
    pos: Coord;
    init() {
        self.pos = Coord{ x: 100, y: 200, z: null };
    }
}