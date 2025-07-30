struct IntsWithSerialization {
    i1: Int as uint32;
    i2: Int as int64;
    i3: Int as uint8;
    i4: Int as int16;
    i5: Int;
}

contract IntSerializationTest {
    data: IntsWithSerialization;

    init() {
        self.data = IntsWithSerialization{
            i1: 100,
            i2: -1000,
            i3: 255,
            i4: -200,
            i5: 123456789
        };
    }
}