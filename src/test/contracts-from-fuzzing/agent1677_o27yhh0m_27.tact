contract SerializeSizes {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int8;
    d: Int as int64;

    init() {
        self.a = 255;
        self.b = 0xFFFFFFFFFFFFFFFF;
        self.c = 127;
        self.d = -9223372036854775808;
    }
}