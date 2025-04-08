contract SerializationVariants {
    a: Int as int64;
    b: Int as uint4;
    c: Int as uint128;
    d: Int;

    init() {
        self.a = 100;
        self.b = 5;
        self.c = 18446744073709551616;  // 2^64
        self.d = -12345;
    }
}