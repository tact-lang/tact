contract Numerics {
    i: Int;
    ui4: Int as uint4;
    ui7: Int as uint7;
    i8: Int as int8;
    i64: Int as int64;

    init() {
        self.i = 9;
        self.ui4 = 3;
        self.ui7 = 100;
        self.i8 = -5;
        self.i64 = 12345678;
    }
}