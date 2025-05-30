struct Coord {
    x: Int as uint8;
    y: Int as uint8;
}

contract SerializedCoords {
    coord: Coord;

    init() {
        self.coord = Coord{ x: 255, y: 0 };
    }
}