contract Test {
    a: Int as uint8 = 1;
    b: Int as int16 = -1234;
    c: Int as uint32 = 65535;
    d: Int as int257 = 123456789000;
    e: Int as coins = 10000;

    init() {
        self.a = 2;
        self.b = -5678;
        self.c = 999;
        self.d = 987654321;
        self.e = 42;
    }
}