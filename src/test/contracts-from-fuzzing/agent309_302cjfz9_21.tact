struct WithUints {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
}

contract UintFields {
    vals: WithUints;

    init() {
        self.vals = WithUints{ u4:7, u8:255, u16:65535, u32:4294967295 };
    }
}