struct IntArrays {
    i1: Int as uint1;
    i2: Int as uint8;
    i3: Int as uint32;
    i4: Int as int8;
    i5: Int as int32;
    i6: Int as coins;
}

contract TestContract {
    ints: IntArrays;
    init() {
        self.ints = IntArrays{
            i1: 1, i2: 2, i3: 3, i4: 4, i5: 5, i6: 6
        };
    }
}