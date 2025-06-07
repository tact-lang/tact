// Persistent state fields with explicit serialization of various sizes
contract DifferentSerializations {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    i: Int as int128;
    j: Int as uint128;

    init() {
        self.a = -10;
        self.b = 10;
        self.c = -1000;
        self.d = 1000;
        self.e = -100000;
        self.f = 100000;
        self.g = -10000000000;
        self.h = 10000000000;
        self.i = -10000000000000000;
        self.j = 10000000000000000;
    }
}