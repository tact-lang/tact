contract LargeInts {
    i1: Int as uint8;
    i2: Int as uint16;
    i3: Int as uint32;
    i4: Int as uint64;
    i5: Int as uint128;
    i6: Int as int8;
    i7: Int as int16;
    i8: Int as int32;
    i9: Int as int64;
    i10: Int as int128;

    init() {
        self.i1 = 255;
        self.i2 = 65535;
        self.i3 = 4294967295;
        self.i4 = 18446744073709551615;
        self.i5 = 340282366920938463463374607431768211455;
        self.i6 = -128;
        self.i7 = -32768;
        self.i8 = -2147483648;
        self.i9 = -9223372036854775808;
        self.i10 = -170141183460469231731687303715884105728;
    }
}