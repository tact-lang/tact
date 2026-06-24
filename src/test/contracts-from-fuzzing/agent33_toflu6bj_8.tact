struct ManyInts {
    i1: Int as int8;
    i2: Int as uint8;
    i3: Int as int16;
    i4: Int as uint16;
    i5: Int as int32;
    i6: Int as uint32;
    i7: Int as int64;
    i8: Int as uint64;
    i9: Int as int128;
    i10: Int as uint128;
}

contract TestContract {
    numbers: ManyInts;

    init() {
        self.numbers = ManyInts{
            i1: -1, i2: 1,
            i3: -2, i4: 2,
            i5: -3, i6: 3,
            i7: -4, i8: 4,
            i9: -5, i10: 5
        };
    }
}