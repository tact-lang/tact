contract TestContract {
    u1: Int as uint1;
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
    u256: Int as uint256;

    init() {
        self.u1 = 1;
        self.u4 = 15;
        self.u8 = 255;
        self.u16 = 65535;
        self.u32 = 4294967295;
        self.u64 = 18446744073709551615;
        self.u128 = 340282366920938463463374607431768211455;
        self.u256 = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    }
}
