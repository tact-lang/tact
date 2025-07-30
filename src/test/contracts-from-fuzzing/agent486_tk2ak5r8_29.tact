struct VariousSerialized {
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    coinsVal: Int as coins;
}

contract TestVariousSerialized {
    d: VariousSerialized;

    init() {
        self.d = VariousSerialized{
            i8:0,i16:0,i32:0,i64:0,
            u8:0,u16:0,u32:0,u64:0,
            coinsVal:0
        };
    }
}