contract SerializationMix {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;

    init() {
        self.a = -128;
        self.b = 65535;
        self.c = -2147483648;
        self.d = 18446744073709551615; // 2^64 -1
    }
}