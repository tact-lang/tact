contract IntSerializations {
    a: Int as uint4;
    b: Int as int16;
    c: Int as uint251;
    init() {
        self.a = 7;
        self.b = -8;
        self.c = 123456;
    }
}