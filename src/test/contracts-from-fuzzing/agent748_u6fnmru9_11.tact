struct IntSizes {
    i1: Int as int8;
    i2: Int as uint8;
    i3: Int as int16;
    i4: Int as uint16;
    i5: Int as int32;
    i6: Int as uint32;
    i7: Int as int64;
    i8: Int as uint64;
}

contract TestContract {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            i1: -10,i2:10,i3:-100,i4:100,i5:-1000,i6:1000,i7:-10000,i8:10000
        };
    }
}