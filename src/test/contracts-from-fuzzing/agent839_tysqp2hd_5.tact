contract SerializationMix {
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
    k: Int as int256;
    l: Int as uint256;

    init() {
        self.a = -1;
        self.b = 1;
        self.c = -2;
        self.d = 2;
        self.e = -3;
        self.f = 3;
        self.g = -4;
        self.h = 4;
        self.i = -5;
        self.j = 5;
        self.k = -6;
        self.l = 6;
    }
}