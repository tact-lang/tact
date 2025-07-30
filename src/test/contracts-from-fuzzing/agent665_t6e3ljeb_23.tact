message(0x1111) M {}

struct WithUnsignedInts {
    u1: Int as uint1;
    u8: Int as uint8;
    u128: Int as uint128;
    u256: Int as uint256;
}

contract TestUnsignedSer {
    data: WithUnsignedInts;

    init() {
        self.data = WithUnsignedInts{
            u1: 1,
            u8: 255,
            u128: 123456789012345678901234567890,
            u256: 123456789012345678901234567890123456789012345678901234567890
        };
    }
}
