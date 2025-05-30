struct Coordinates {
    lat: Int as int128;
    lon: Int as int128;
}

contract GeoContract {
    coords: Coordinates;

    init() {
        self.coords = Coordinates{ lat: 123456789, lon: -987654321 };
    }

    receive() {
        self.coords = self.coords;
    }
}