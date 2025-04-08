contract DifferentSerializations {
    a: Int as uint4;
    b: Int as int16;
    c: Int as uint64;
    d: Int;
    e: Int as coins;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 12345678;
        self.d = -100;
        self.e = 1000;
    }
}