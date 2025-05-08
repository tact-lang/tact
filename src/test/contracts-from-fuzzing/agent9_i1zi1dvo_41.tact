contract SerializationMix {
    a: Int as int8;
    b: Int? as uint8;
    c: Int as int64;
    d: Int? as uint32;
    e: Int;

    init() {
        self.a = 127;
        self.b = null;
        self.c = -9876543210;
        self.d = null;
        self.e = 12345678901234567890;
    }
}