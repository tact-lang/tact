contract TestSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int as coins;

    init() {
        self.a = 100;
        self.b = -1000;
        self.c = 5000;
    }
}
