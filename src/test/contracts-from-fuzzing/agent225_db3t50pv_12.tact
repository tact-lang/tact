contract MixedSerializations {
    a: Int as uint4;
    b: Int as int64;
    c: Int as coins;
    d: Int;

    init() {
        self.a = 7;
        self.b = -42;
        self.c = ton("1");
        self.d = 100;
    }
}