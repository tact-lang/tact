struct UintVariety {
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
}

contract UintSerializationContract {
    data: UintVariety;

    init() {
        self.data = UintVariety{
            u8: 1,
            u16: 2,
            u32: 3,
            u64: 4
        };
    }
}
