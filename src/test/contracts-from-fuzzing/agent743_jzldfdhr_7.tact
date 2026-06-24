struct SpecSizes {
    u4: Int as uint4;
    u8: Int as uint8;
    u32: Int as uint32;
    i16: Int as int16;
    i64: Int as int64;
    b1: Bool; // always serialized as one bit
}

contract SerializedVars {
    s: SpecSizes;

    init() {
        self.s = SpecSizes{
            u4: 5,
            u8: 200,
            u32: 1234567890,
            i16: -12345,
            i64: -9876543210,
            b1: true
        };
    }
}