contract SerializedUintInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as uint64;

    init() {
        self.a = 5;
        self.b = 20;
        self.c = 300;
        self.d = 70000;
        self.e = 123456789;
    }
}