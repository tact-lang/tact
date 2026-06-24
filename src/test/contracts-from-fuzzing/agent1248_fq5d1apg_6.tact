struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

contract SerializedFields {
    coord: Coordinates;

    init() {
        self.coord = Coordinates{x:123,y:456};
    }
}
