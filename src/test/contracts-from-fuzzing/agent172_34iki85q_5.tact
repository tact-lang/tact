struct Location {
    name: String?;
    x: Int as int64;
    y: Int as int64;
}

struct Traveler {
    id: Int as uint32;
    destination: Location?;
}

contract TravelerStorage {
    traveler: Traveler;

    init() {
        self.traveler = Traveler{
            id: 777,
            destination: Location{
                name: null,
                x: 1000,
                y: 2000,
            }
        };
    }
}