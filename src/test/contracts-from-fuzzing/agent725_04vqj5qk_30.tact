struct DifferentWidths {
    s8: Int as int8;
    u16: Int as uint16;
    s32: Int as int32;
    u64: Int as uint64;
    s128: Int as int128;
    u256: Int as uint256;
}

contract DiverseWidths {
    field: DifferentWidths;

    init() {
        self.field = DifferentWidths{
            s8: -1,
            u16: 2,
            s32: -3,
            u64: 4,
            s128: -5,
            u256: 6,
        };
    }
}