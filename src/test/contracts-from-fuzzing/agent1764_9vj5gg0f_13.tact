contract TestContract {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint64;
    e: Int as int257;

    init() {
        self.a = -5;
        self.b = 250;
        self.c = -123456789;
        self.d = 123456789;
        self.e = -1;
    }
}
