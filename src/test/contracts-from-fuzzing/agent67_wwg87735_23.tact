contract DifferentSerialization {
    a: Int as uint64;
    b: Int as int8;
    c: Int as uint1;
    d: Int;

    init() {
        self.a = 100;
        self.b = 5;
        self.c = 1;
        self.d = -50;
    }
}
