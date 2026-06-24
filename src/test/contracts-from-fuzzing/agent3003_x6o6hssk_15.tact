struct Spread {
    x: Int as int8;
    y: Int as int16;
    z: Int as int32;
    k: Int as int64;
}

contract SerializationWidths {
    s: Spread;

    init() {
        self.s = Spread{
            x: 1, y: 2, z: 3, k: 4
        };
    }
}
