struct VarSizes {
    i8: Int as int8;
    i16: Int as int16;
    u8: Int as uint8;
    u64: Int as uint64;
    big: Int; // default 257 bits
}

contract SerializedSizes {
    sizes: VarSizes;

    init() {
        self.sizes = VarSizes{
            i8: 127,
            i16: -32000,
            u8: 250,
            u64: 1234567890,
            big: 9876543210,
        };
    }
}
