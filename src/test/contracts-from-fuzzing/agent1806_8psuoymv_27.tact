contract SerializeSizes {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    i4: Int as int4;
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    init() {
        self.u4=1; self.u8=2; self.u16=3; self.u32=4; self.u64=5;
        self.i4=-1; self.i8=-2; self.i16=-3; self.i32=-4; self.i64=-5;
    }
}