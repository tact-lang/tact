contract SerializedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;

    init() {
        self.a = 2;
        self.b = -12;
        self.c = 500;
        self.d = -10000;
        self.e = 1000;
    }
}