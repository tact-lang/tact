struct Coordinates {
    lat: Int;
    lon: Int;
}

struct Location {
    coords: Coordinates;
    name: String;
    comment: String?;
}

contract NestedOptionals {
    loc: Location;

    init() {
        self.loc = Location{
            coords: Coordinates{lat: 10, lon: 20},
            name: "Here",
            comment: null
        };
    }
}