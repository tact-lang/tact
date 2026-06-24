contract SerializeDifferentSizes {
    i1: Int as uint4;
    i2: Int as int32;
    i3: Int as uint64;
    i4: Int as int128;
    i5: Int as uint256;

    init() {
        self.i1 = 5;
        self.i2 = -123456;
        self.i3 = 1234567890;
        self.i4 = -1 << 127;
        self.i5 = 1 << 255;
    }
}