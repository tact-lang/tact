contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int32;
    e: Int as uint4;

    init() {
        self.a = 5;
        self.b = -123;
        self.c = 123456789;
        self.d = -45678;
        self.e = 7;
    }
}
