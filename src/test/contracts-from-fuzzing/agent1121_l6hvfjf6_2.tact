struct Coordinate {
    x: Int;
    y: Int;
}

contract StructInField {
    coord: Coordinate;

    init() {
        self.coord = Coordinate{x: 0, y: 0};
    }
}