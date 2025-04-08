contract SerializationExtreme {
    u1: Int as uint1;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
    u256: Int as uint256;

    i1: Int as int1;
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    i128: Int as int128;
    i256: Int as int256;

    init() {
        self.u1=1;self.u8=2;self.u16=3;self.u32=4;self.u64=5;
        self.u128=6;self.u256=7;
        self.i1=-1;self.i8=-5;self.i16=-10;self.i32=-15;
        self.i64=-20;self.i128=-25;self.i256=-30;
    }
}