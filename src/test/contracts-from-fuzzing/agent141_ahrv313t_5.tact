struct Coordinates {
    lat: Int;
    lon: Int;
    alt: Int?;
}

contract OptionalStructField {
    point: Coordinates;

    init() {
        self.point = Coordinates{ lat: 50, lon: 30, alt: null };
    }
}