contract NegativeZero {
    n0: Int as int8; // signed 8bit
    p0: Int as uint8; // unsigned 8bit

    init() {
        self.n0 = 0;
        self.p0 = 0;
    }
}
