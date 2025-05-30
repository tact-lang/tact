struct IntWithDifferentSerialization {
    u8: Int as uint8;
    i16: Int as int16;
    u64: Int as uint64;
    fullInt: Int; // implicit int257
}

contract Test {
    data: IntWithDifferentSerialization;

    init() {
        self.data = IntWithDifferentSerialization{
            u8: 255,
            i16: -32768,
            u64: 1234567890,
            fullInt: -1,
        };
    }
}