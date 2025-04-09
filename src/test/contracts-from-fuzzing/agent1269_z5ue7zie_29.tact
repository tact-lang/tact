contract TestContract {
    a: Int as int64 = 1;
    b: Int as uint64 = 2;
    c: Int as int8 = 3;
    d: Int as uint8 = 4;
    e: Int as int256 = 5;
    f: Int as uint256 = 6;

    init() {
        self.a = -1;
        self.b = 1000;
        self.c = -5;
        self.d = 10;
        self.e = 1234567890123;
        self.f = 9876543210;
    }
}