contract Test {
    i1: Int;
    i2: Int as uint8;
    i3: Int as int64;
    i4: Int as uint32;

    init() {
        self.i1 = 100;
        self.i2 = 200;
        self.i3 = -42;
        self.i4 = 4000000000;
    }
}