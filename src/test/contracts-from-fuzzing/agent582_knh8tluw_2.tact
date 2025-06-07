struct Coordinates {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}

contract LargeVector {
    vec: Coordinates;

    init() {
        self.vec = Coordinates{
            x: 100,
            y: 200,
            z: 300
        };
    }
}
