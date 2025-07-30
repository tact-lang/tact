struct Coordinates {
    x: Int as int32;
    y: Int as int32;
}

contract OptionalSerialization {
    coords: Coordinates?;

    init() {
        self.coords = Coordinates{x: 10, y: 20};
    }
}
