struct Intz {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int256;
}

contract IntSerialization {
    ints: Intz;
    init() {
        self.ints = Intz{ a: 1, b: 2, c: 3, d: 4 };
    }
}
