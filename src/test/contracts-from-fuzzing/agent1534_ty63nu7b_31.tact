contract OptionalSerExtreme {
    u1: Int? as uint1;
    u8: Int? as uint8;
    u16: Int? as uint16;
    u32: Int? as uint32;
    u64: Int? as uint64;
    u128: Int? as uint128;
    u256: Int? as uint256;

    i1: Int? as int1;
    i8: Int? as int8;
    i16: Int? as int16;
    i32: Int? as int32;
    i64: Int? as int64;
    i128: Int? as int128;
    i256: Int? as int256;

    init() {
        self.u1=null;self.u8=null;self.u16=null;self.u32=null;self.u64=null;
        self.u128=null;self.u256=null;
        self.i1=null;self.i8=null;self.i16=null;self.i32=null;
        self.i64=null;self.i128=null;self.i256=null;
    }
}