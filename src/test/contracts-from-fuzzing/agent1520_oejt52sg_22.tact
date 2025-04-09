struct EdgeInts {
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    i128: Int as int128;
    u1: Int as uint1;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
}

contract IntContract {
    edge: EdgeInts;
    init() {
        self.edge = EdgeInts{
            i8: 1,
            i16: 2,
            i32: 3,
            i64: 4,
            i128: 5,
            u1: 1,
            u8: 8,
            u16: 16,
            u32: 32,
            u64: 64,
            u128: 128,
        };
    }
}