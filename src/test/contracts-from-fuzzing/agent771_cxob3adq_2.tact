struct Coordinates {
    lat: Int;
    long: Int;
}

struct Location {
    city: String;
    country: String;
    coords: Coordinates;
    nickname: String?;
}

contract GeoContract {
    mainLocation: Location = Location{
        city: "Paris",
        country: "France",
        coords: Coordinates{ lat: 48, long: 2 },
        nickname: null,
    };

    init() {
        self.mainLocation = Location{
            city: "Tokyo",
            country: "Japan",
            coords: Coordinates{ lat: 35, long: 139 },
            nickname: "Edo",
        };
    }
}
