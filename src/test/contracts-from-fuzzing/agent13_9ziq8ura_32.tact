contract TestSerialization {
    a: Int as int64;
    b: Int as uint8;
    c: Int?;
    d: Bool;
    e: Bool?;

    init() {
        self.a = 123;
        self.b = 255;
        self.c = null;
        self.d = true;
        self.e = null;
    }
}