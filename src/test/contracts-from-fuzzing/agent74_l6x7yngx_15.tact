struct Big {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
    i11: Int;
    i12: Int;
    i13: Int;
    i14: Int;
    i15: Int;
}

contract Test {
    s: Big;

    init() {
        self.s = Big{
            i1:1, i2:2, i3:3, i4:4, i5:5,
            i6:6, i7:7, i8:8, i9:9, i10:10,
            i11:11,i12:12,i13:13,i14:14,i15:15
        };
    }
}