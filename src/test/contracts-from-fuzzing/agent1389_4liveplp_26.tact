contract IntSerializations {
    i1: Int as int8;
    i2: Int as uint8;
    i3: Int as int256;
    i4: Int as uint256;

    init() {
        self.i1 = 127;
        self.i2 = 255;
        self.i3 = -1;
        self.i4 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    }
}