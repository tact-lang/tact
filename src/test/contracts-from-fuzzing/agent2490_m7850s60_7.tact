contract LargeIntSerialization {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint128;
    e: Int as int257;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 0;
        self.e = 0;
    }
}