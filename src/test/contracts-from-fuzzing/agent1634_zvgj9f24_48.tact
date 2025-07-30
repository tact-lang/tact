contract DifferentSerializations {
    i1: Int as int4;
    i2: Int as int64;
    i3: Int as uint32;

    init() {
        self.i1 = 3;
        self.i2 = 999999;
        self.i3 = 123456;
    }
}