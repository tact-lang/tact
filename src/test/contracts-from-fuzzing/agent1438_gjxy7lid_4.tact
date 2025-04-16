struct ManyInts {
    i1: Int as uint8;
    i2: Int as uint8;
    i3: Int as uint8;
    i4: Int as uint8;
    i5: Int as uint8;
    i6: Int as uint8;
    i7: Int as uint8;
    i8: Int as uint8;
    i9: Int as uint8;
    i10: Int as uint8;
    i11: Int as uint8;
    i12: Int as uint8;
    i13: Int as uint8;
    i14: Int as uint8;
    i15: Int as uint8;
    i16: Int as uint8;
    i17: Int as uint8;
    i18: Int as uint8;
    i19: Int as uint8;
    i20: Int as uint8;
}

contract TestManyInts {
    huge: ManyInts;

    init() {
        self.huge = ManyInts{
            i1: 1, i2: 2, i3:3, i4:4, i5:5,
            i6:6, i7:7, i8:8, i9:9, i10:10,
            i11:11, i12:12, i13:13, i14:14, i15:15,
            i16:16, i17:17, i18:18, i19:19, i20:20,
        };
    }
}