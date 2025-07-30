contract TypesWithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int;
    d: Bool;

    init() {
        self.a = 12;
        self.b = -42;
        self.c = 1000;
        self.d = true;
    }
}
