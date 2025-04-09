contract IntsWithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
    }
}