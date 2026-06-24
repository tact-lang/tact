struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

contract SimplePersist {
    position: Coordinates;
    init() {
        self.position = Coordinates{x: 1, y: 2};
    }
}
