struct MixedSerialization {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint32;
    i4: Int;
    i5: Int as int64;
}

contract MixedSerializationTest {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            i1: 1,
            i2: -2,
            i3: 3,
            i4: 4,
            i5: -5,
        };
    }
}