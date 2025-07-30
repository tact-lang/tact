contract Test6 {
    a: Int as uint8;
    b: Int as int128;
    c: Int as uint256;
    d: Int as int1;
    e: Int as uint4;

    init() {
        self.a = 1;
        self.b = -42;
        self.c = 1000000000000;
        self.d = 1;
        self.e = 9;
    }
}