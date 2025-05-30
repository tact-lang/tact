contract SerializeInits {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint128;

    init() {
        self.a = 128;
        self.b = -1000;
        self.c = 0xffffffffffffffffffffffffffffffff;
    }
}