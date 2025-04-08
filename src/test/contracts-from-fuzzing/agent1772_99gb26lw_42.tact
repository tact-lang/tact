contract Test42 {
    a: Int as int128;
    b: Int as uint128;
    c: Int as int64;
    d: Int as uint64;

    init() {
        self.a = -123456789;
        self.b = 123456789;
        self.c = -987654321;
        self.d = 987654321;
    }
}