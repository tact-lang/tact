contract MaxBitInt {
    a: Int as int257; // full 257 bits
    b: Int as uint256; // 256-bit unsigned
    c: Int as int1; // 1-bit signed
    d: Int as uint1; // 1-bit unsigned

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 0;
    }
}
