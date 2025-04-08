struct Coord {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}

contract Vector3 {
    pos: Coord;
    init() {
        self.pos = Coord{
            x: 1,
            y: 2,
            z: 3
        };
    }
}