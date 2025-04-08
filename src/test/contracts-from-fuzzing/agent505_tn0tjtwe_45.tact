contract IntMixSerialization {
    u8: Int as uint8;
    i8: Int as int8;
    u32: Int as uint32;
    i16: Int as int16;
    u64: Int as uint64;
    i32: Int as int32;
    bigint: Int;

    init() {
        self.u8=1; self.i8=-1; self.u32=2; self.i16=-2; self.u64=3; self.i32=-3; self.bigint=999;
    }
}
