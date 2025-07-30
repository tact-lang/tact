contract DifferentSerializations {
    a: Int as int64;
    b: Int as uint128;
    c: Int as int32;
    d: Int as uint8;

    init() {
        self.a = -1000;
        self.b = 1000;
        self.c = -32;
        self.d = 255;
    }
}