struct ManyInts {
    i1: Int as int8;
    i2: Int as int16;
    i3: Int as uint32;
    i4: Int as int64;
    i5: Int;
    i6: Int as uint256;
}

contract SpreadInts {
    nums: ManyInts;

    init() {
        self.nums = ManyInts{
            i1: 1,
            i2: 2,
            i3: 3,
            i4: 4,
            i5: 5,
            i6: 6,
        };
    }
}
