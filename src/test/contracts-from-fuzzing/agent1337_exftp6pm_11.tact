contract IntWithSerialization {
    a: Int as int1;
    b: Int as int8;
    c: Int as int32;
    d: Int as int257;
    e: Int as uint1;
    f: Int as uint8;
    g: Int as uint32;
    h: Int as uint256;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = 2;
        self.d = 3;
        self.e = 4;
        self.f = 5;
        self.g = 6;
        self.h = 7;
    }
}