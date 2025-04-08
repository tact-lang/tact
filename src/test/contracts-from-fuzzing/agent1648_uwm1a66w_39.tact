contract DefaultNumeric {
    i: Int = 0;
    u4: Int as uint4 = 1;
    i16: Int as int16 = -42;

    init() {
        self.i = 42;
        self.u4 = 5;
        self.i16 = -5;
    }
}