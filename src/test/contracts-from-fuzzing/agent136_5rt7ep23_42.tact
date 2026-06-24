contract SmallInts {
    i4: Int as uint4 = 0;
    i8: Int as uint8 = 0;
    i16: Int as int16 = 0;
    i32: Int as uint32 = 0;
    i64: Int as int64 = 0;

    init() {
        self.i4 = 5;
        self.i8 = 10;
        self.i16 = -20;
        self.i32 = 1000;
        self.i64 = -100000;
    }
}