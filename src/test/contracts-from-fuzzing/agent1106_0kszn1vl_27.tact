contract MixSerializationFormats {
    i8: Int as int8;
    u32: Int as uint32;
    i64: Int as int64;
    u4: Int as uint4;

    init() {
        self.i8 = 0;
        self.u32 = 0;
        self.i64 = 0;
        self.u4 = 0;
    }
}