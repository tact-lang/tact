contract SerializeVariants {
    i1: Int as uint1;
    i2: Int as int8;
    i3: Int as uint16;
    i4: Int as int32;
    i5: Int as uint64;
    i6: Int as int128;

    init() {
        self.i1 = 1;
        self.i2 = -5;
        self.i3 = 300;
        self.i4 = -1000000;
        self.i5 = 123456789;
        self.i6 = -987654321;
    }
}