contract MixedSerializations {
    a: Int as int64;
    b: Int as uint8;
    c: Int;
    d: Int as coins;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = 2;
        self.d = ton("1");
    }
}