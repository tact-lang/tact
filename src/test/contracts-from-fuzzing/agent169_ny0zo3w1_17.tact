contract TestContract {
    a: Int as uint4;
    b: Int as uint16;
    c: Int as int64;

    init() {
        self.a = 0;
        self.b = 65535;
        self.c = -9223372036854775808;
    }
}