contract StorageTest {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int128;
    d: Int as uint128;
    e: Int as int256;
    f: Int as uint256;

    init() {
        self.a = -10;
        self.b = 10;
        self.c = -1000;
        self.d = 1000;
        self.e = -100000;
        self.f = 100000;
    }
}