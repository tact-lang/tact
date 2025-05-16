struct Coordinates {
    lon: Int;
    lat: Int;
}

contract OptionalStructField {
    coords: Coordinates?;

    init() {
        self.coords = Coordinates{lon: 10, lat: 20};
    }
}
