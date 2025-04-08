struct MultiInts {
    i1: Int as int1;
    i2: Int as int8;
    i3: Int as int16;
    i4: Int as int32;
    i5: Int as int64;
    i6: Int as int257;
}

contract TestContract {
    data: MultiInts;

    init() {
        self.data = MultiInts{
            i1: -1,
            i2: -8,
            i3: -16,
            i4: -32,
            i5: -64,
            i6: -257
        };
    }
}