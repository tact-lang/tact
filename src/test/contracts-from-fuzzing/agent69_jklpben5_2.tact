struct Coord {
    x: Int as int8;
    y: Int as int8;
    z: Int as int8;
}

contract TinySerialized {
    coord: Coord;
    
    init() {
        self.coord = Coord{x: 1, y: 2, z: 3};
    }
}