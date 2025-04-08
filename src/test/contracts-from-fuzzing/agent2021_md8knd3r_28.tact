contract SerializeWidths {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 4294967295;
        self.d = -9223372036854775808;
        self.e = 340282366920938463463374607431768211455;
    }
}
