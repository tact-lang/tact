contract IntSerialize {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;

    init() {
        self.a = -1;
        self.b = 255;
        self.c = -12345;
        self.d = 123456789;
    }
}
