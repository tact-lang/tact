struct Coord {
    x: Int;
    y: Int;
    z: Int;
}

contract LargeStructField {
    coords: Coord;

    init() {
        self.coords = Coord{ x: 1, y: 2, z: 3 };
    }
}