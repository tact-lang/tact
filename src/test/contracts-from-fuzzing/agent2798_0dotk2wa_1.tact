struct Coordinates {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}

contract CoordHolder {
    coords: Coordinates;

    init() {
        self.coords = Coordinates{ x: 1, y: 2, z: 3 };
    }
}