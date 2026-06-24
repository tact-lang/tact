contract IntSerializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;

    init() {
        self.a = 10;
        self.b = -200;
        self.c = 10000;
        self.d = -123456789;
    }
}
