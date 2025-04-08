contract TestContract {
    i1: Int as int8 = 1;
    i2: Int as int16 = 2;
    i3: Int as int32 = 3;
    i4: Int as int64 = 4;
    i5: Int as int128 = 5;
    u1: Int as uint8 = 6;
    u2: Int as uint16 = 7;
    u3: Int as uint32 = 8;
    u4: Int as uint64 = 9;
    u5: Int as uint128 = 10;

    init() {
        self.i1 = -1;
        self.i2 = -2;
        self.i3 = -3;
        self.i4 = -4;
        self.i5 = -5;
        self.u1 = 11;
        self.u2 = 12;
        self.u3 = 13;
        self.u4 = 14;
        self.u5 = 15;
    }
}
