contract MixedSizes {
    a: Int as uint4;
    b: Int as uint64;
    c: Int as int128;
    d: Int as uint256;

    init() {
        self.a = 5;
        self.b = 1000;
        self.c = -99999;
        self.d = 123456789;
    }
}