contract BitsSerialization {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as uint32;
    init() {
        self.a = 1;
        self.b = 3;
        self.c = 7;
        self.d = 10;
        self.e = 20;
    }
}