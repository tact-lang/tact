struct Coord {
    x: Int?;
    y: Int?;
}

contract OptionalStructFields {
    coord: Coord;

    init() {
        self.coord = Coord{ x: null, y: 5 };
    }
}