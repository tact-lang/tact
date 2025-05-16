struct Coord {
    x: Int as int64;
    y: Int as int64;
}

contract SerializedFields {
    coord: Coord;
    init() {
        self.coord = Coord { x: -123, y: 456 };
    }
}
