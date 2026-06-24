struct ManyOptInts {
    i0: Int?;
    i1: Int?;
    i2: Int?;
    i3: Int?;
    i4: Int?;
    i5: Int?;
    i6: Int?;
    i7: Int?;
    i8: Int?;
    i9: Int?;
    i10: Int?;
    i11: Int?;
    i12: Int?;
    i13: Int?;
    i14: Int?;
    i15: Int?;
    i16: Int?;
    i17: Int?;
    i18: Int?;
    i19: Int?;
}

contract LotsOfOptionals {
    bigOpt: ManyOptInts = ManyOptInts{
        i0: null, i1: null, i2: null, i3: null, i4: null, 
        i5: null, i6: null, i7: null, i8: null, i9: null,
        i10: null, i11: null, i12: null, i13: null, i14: null,
        i15: null, i16: null, i17: null, i18: null, i19: null
    };
    init() {}
}