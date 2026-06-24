contract ScalarSerializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int;

    init() {
        self.a = 10;
        self.b = -20;
        self.c = 200;
        self.d = 300;
    }
}