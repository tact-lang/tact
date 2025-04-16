struct ManyInts {
    i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
    i6: Int; i7: Int; i8: Int; i9: Int; i10: Int;
    i11: Int; i12: Int; i13: Int; i14: Int; i15: Int;
    i16: Int; i17: Int; i18: Int; i19: Int; i20: Int;
}

contract BigIntSet {
    data: ManyInts;

    init() {
        self.data = ManyInts{
            i1:0, i2:0, i3:0, i4:0, i5:0,
            i6:0, i7:0, i8:0, i9:0, i10:0,
            i11:0, i12:0, i13:0, i14:0, i15:0,
            i16:0, i17:0, i18:0, i19:0, i20:0,
        };
    }
}
