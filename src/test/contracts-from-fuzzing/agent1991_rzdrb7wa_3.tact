struct Coord {
    x: Int as int64;
    y: Int as int64;
}

contract PointField {
    coord: Coord;

    init() {
        self.coord = Coord{ x: 0, y: 0 };
    }
}