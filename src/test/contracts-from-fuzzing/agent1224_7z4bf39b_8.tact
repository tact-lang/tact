contract H {
    i1: Int as int8;
    i2: Int as uint8;
    i3: Int as int256;
    i4: Int as uint256;
    i5: Int; // default int257

    init() {
        self.i1 = -10;
        self.i2 = 250;
        self.i3 = 1000000;
        self.i4 = 1000000;
        self.i5 = 12345;
    }
}