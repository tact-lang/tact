struct IntSizes {
    i4: Int as int4;
    u4: Int as uint4;
    i8: Int as int8;
    u8: Int as uint8;
    i64: Int as int64;
    u64: Int as uint64;
    i257: Int as int257;
}

contract IntSizesContract {
    data: IntSizes = IntSizes{
        i4: 0,
        u4: 0,
        i8: 0,
        u8: 0,
        i64: 0,
        u64: 0,
        i257: 0,
    };
}