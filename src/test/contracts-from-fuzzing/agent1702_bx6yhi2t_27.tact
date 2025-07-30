struct Coordinates {
    x: Int as int128;
    y: Int as int128;
}

contract MultipleOptionalStructs {
    p1: Coordinates?;
    p2: Coordinates?;

    init() {
        self.p1 = Coordinates{x:7,y:8};
        self.p2 = null;
    }
}
