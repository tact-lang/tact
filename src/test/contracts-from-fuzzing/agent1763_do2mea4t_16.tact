contract InterleavedSerializeOptional {
    a: Int as uint8;
    b: Int?;
    c: Int as uint16;
    d: Int?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = 1000;
        self.d = null;
    }
}