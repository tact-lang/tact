struct Coordinates {
    lat: Int;
    lon: Int;
}

struct Location {
    name: String;
    coords: Coordinates;
    description: String?;
    visited: Bool;
}

contract Explorer {
    lastLocation: Location;

    init() {
        self.lastLocation = Location{
            name: "Moon",
            coords: Coordinates{lat: 0, lon: 0},
            description: null,
            visited: false,
        };
    }
}