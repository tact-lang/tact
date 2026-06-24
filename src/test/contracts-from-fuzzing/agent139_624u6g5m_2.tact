struct Coordinates {
    lat: Int;
    lng: Int;
}

struct Location {
    name: String;
    coords: Coordinates;
}

contract ComplexContract {
    loc: Location;

    init() {
        self.loc = Location{
            name: "Earth",
            coords: Coordinates{ lat: 0, lng: 0 }
        };
    }
}