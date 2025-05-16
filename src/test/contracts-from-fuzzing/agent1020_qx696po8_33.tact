struct IntSizes {
    i1: Int as int4;
    i2: Int as uint8;
    i3: Int as int32;
    i4: Int as uint64;
    i5: Int;
}

contract IntSizesTest {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            i1: 3, i2: 255, i3: 32768, i4: 65536, i5: 1234567
        };
    }
}