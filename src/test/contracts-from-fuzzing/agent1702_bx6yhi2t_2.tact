struct Coordinates {
    x: Int as int128;
    y: Int as int128;
}

contract MixedSerialization {
    loc: Coordinates;
    highPrecision: Int as int256;
    smallFlag: Bool;

    init() {
        self.loc = Coordinates{x: 123, y: 456};
        self.highPrecision = 789;
        self.smallFlag = true;
    }
}
