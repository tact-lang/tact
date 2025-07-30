struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

struct Geo {
    pos: Coordinates;
    label: String;
    number: Int?;
}

contract Geom {
    g: Geo;
    init() {
        self.g = Geo{
            pos: Coordinates{x: -100, y: 200},
            label: "origin",
            number: null
        };
    }
}
