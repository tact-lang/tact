contract MixedSerializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;

    init() {
        self.a = 12;
        self.b = -30;
        self.c = 70000;
        self.d = -1234567;
        self.e = ton("0.3");
    }
}