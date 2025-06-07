contract LargePrimitives {
    i1: Int as int8;
    i2: Int as int16;
    i3: Int as int32;
    i4: Int as int64;
    i5: Int as int128;
    u1: Int as uint8;
    u2: Int as uint16;
    u3: Int as uint32;
    u4: Int as uint64;
    u5: Int as uint128;

    init() {
        self.i1 = -1;
        self.i2 = -2;
        self.i3 = -3;
        self.i4 = -4;
        self.i5 = -5;
        self.u1 = 1;
        self.u2 = 2;
        self.u3 = 3;
        self.u4 = 4;
        self.u5 = 5;
    }
}
