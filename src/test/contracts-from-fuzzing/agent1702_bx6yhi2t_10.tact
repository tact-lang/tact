struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

contract DefaultSerialization {
    point: Coordinates;

    init() {
        self.point = Coordinates{x: 42, y: -42};
    }
}
