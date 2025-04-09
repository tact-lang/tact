contract ManySerializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;

    init() {
        self.a = 1;
        self.b = -123;
        self.c = 12345;
        self.d = -987654321;
        self.e = ton("10");
    }
}