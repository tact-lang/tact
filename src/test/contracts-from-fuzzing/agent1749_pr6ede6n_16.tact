struct IntsAllSizes {
    i1: Int as int8;
    i2: Int as int16;
    i3: Int as int32;
    i4: Int as int64;
    i5: Int as uint8;
    i6: Int as uint16;
    i7: Int as uint32;
    i8: Int as uint64;
}

contract VariousIntSizes {
    s: IntsAllSizes;
    init() {
        self.s = IntsAllSizes{
            i1:-1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8
        };
    }
}