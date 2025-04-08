struct Coords {
    lat: Int as int64;
    lon: Int as int64;
}

contract Test25 {
    loc: Coords;

    init() {
        self.loc = Coords{ lat: 50000000, lon: 50000000 };
    }
}