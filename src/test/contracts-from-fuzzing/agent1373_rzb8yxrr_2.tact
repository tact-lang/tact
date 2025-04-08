struct Coord {
    x: Int;
    y: Int;
    z: Int?;
    label: String;
}

contract CoordHolder {
    coord: Coord;

    init() {
        self.coord = Coord{
            x: 123,
            y: 456,
            z: null,
            label: "test",
        };
    }
}