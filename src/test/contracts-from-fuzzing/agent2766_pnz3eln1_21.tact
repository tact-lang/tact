struct IntSerialization {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    big: Int;
}

contract SerializeInts {
    val: IntSerialization;

    init() {
        self.val = IntSerialization{
            u4: 7,
            u8: 100,
            u16: 30000,
            u32: 4000000,
            u64: 5000000000,
            big: 600000000000,
        };
    }
}