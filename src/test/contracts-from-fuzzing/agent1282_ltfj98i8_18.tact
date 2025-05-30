contract SerializeInts {
    a: Int;
    b: Int as int64;
    c: Int as uint32;
    d: Int;
    e: Int as coins;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}