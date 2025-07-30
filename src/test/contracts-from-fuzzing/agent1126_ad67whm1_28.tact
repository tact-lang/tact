contract WideSerialize {
    a: Int as uint8;
    b: Int as int128;
    c: Int as uint64;
    d: Int;

    init() {
        self.a = 7;
        self.b = -10000000;
        self.c = 12345678;
        self.d = -1;
    }
}