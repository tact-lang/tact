struct Coord {
    lat: Int;
    lng: Int;
}

struct Location {
    coord: Coord;
    label: String;
}

contract Test {
    loc: Location;

    init() {
        self.loc = Location{
            coord: Coord{ lat: 42, lng: 24 },
            label: "Test"
        };
    }
}