contract IntSizes {
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    i128: Int as int128;

    init() {
        self.i8 = 1;
        self.i16 = 2;
        self.i32 = 3;
        self.i64 = 4;
        self.i128 = 5;
    }
}