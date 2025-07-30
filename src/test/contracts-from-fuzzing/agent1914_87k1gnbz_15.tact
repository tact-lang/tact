contract TestContract {
    a: Int as uint64;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint256;

    init() {
        self.a = 10;
        self.b = 255;
        self.c = -1234;
        self.d = 1234567890;
    }
}