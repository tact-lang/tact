struct Complex {
    coord: Coord;
    name: String;
    active: Bool;
    count: Int as uint16;
}

struct Coord {
    lat: Int as int64;
    lon: Int as int64;
}

contract ComplexContract {
    data: Complex;
    init() {
        self.data = Complex{
            coord: Coord{lat: 100, lon: 50},
            name: "Test",
            active: true,
            count: 42
        };
    }
}