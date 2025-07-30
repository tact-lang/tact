struct Coord {
    lat: Int;
    lon: Int;
}

struct Location {
    id: Int;
    name: String;
    coords: Coord;
}

contract ManyFields {
    id: Int;
    name: String;
    active: Bool;
    count: Int;
    score: Int;
    flag: Bool;
    location: Location;

    init() {
        self.id = 123;
        self.name = "Test";
        self.active = true;
        self.count = 10;
        self.score = 42;
        self.flag = false;
        self.location = Location{
            id: 1,
            name: "Main",
            coords: Coord{lat: 55, lon: 37}
        };
    }
}
