contract CrazySerializations {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint64;
    d: Int;

    init() {
        self.a = 7;
        self.b = -5;
        self.c = 123456789;
        self.d = -987654321;
    }
}