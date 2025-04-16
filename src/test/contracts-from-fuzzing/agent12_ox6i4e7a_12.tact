contract IntSerializationWidths {
    i1: Int as int4;
    i2: Int as uint8;
    i3: Int as int16;
    i4: Int as uint32;
    i5: Int as int128;
    i6: Int as uint256;

    init() {
        self.i1 = 1;
        self.i2 = 1;
        self.i3 = 1;
        self.i4 = 1;
        self.i5 = 1;
        self.i6 = 1;
    }

    receive() {
        self.i1 = 2;
    }
}
