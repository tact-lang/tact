struct Coordinates {
    latitude: Int as int64;
    longitude: Int as int64;
}

struct Location {
    city: String;
    coords: Coordinates;
}

struct User {
    name: String;
    age: Int;
    loc: Location;
}

contract ComplexProfile {
    profile: User;

    init() {
        self.profile = User {
            name: "Sam",
            age: 30,
            loc: Location {
                city: "Nowhere",
                coords: Coordinates { latitude: 42, longitude: 43 }
            }
        };
    }
}