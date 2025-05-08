contract VariedWidths {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int;
    g: Int as uint256;

    init() {
        self.a = 5;
        self.b = -3;
        self.c = 255;
        self.d = -45000;
        self.e = 100000;
        self.f = 123456;
        self.g = 2;
    }
}