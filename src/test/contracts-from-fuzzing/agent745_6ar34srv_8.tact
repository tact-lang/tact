struct IntVariants {
    i1: Int as uint4;
    i2: Int as uint8;
    i3: Int as uint16;
    i4: Int as uint32;
    i5: Int as int64;
    i6: Int as int257;
}

contract IntSerializationTest {
    data: IntVariants;
    init() {
        self.data = IntVariants{
            i1: 1, i2:2, i3:3, i4:4, i5:5, i6:6
        };
    }
}