contract NegativeBoundaryTest {
    i4: Int as int4;
    i9: Int as int9;
    i17: Int as int17;

    init() {
        self.i4 = -8;
        self.i9 = -256;
        self.i17 = -65536;
    }
}