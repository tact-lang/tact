struct PackedUints {
    u1: Int as uint1;
    u2: Int as uint2;
    u3: Int as uint4;
    u4: Int as uint8;
    u5: Int as uint16;
    u6: Int as uint32;
    u7: Int as uint64;
    u8: Int as uint128;
    u9: Int as uint256;
}

contract TestContract {
    pu: PackedUints;

    init() {
        self.pu = PackedUints{u1:0,u2:1,u3:2,u4:3,u5:4,u6:5,u7:6,u8:7,u9:8};
    }
}