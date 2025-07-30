contract OptionalAndSerialized {
    a: Int?;
    b: Int as uint32;
    c: Int?;
    d: Int as int16;
    e: Int?;
    f: Int as coins;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = -10;
        self.e = 5;
        self.f = 10000;
    }
}