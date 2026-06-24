contract IntSerialization {
    a: Int as uint4;     // 0..15
    b: Int as uint8;     // 0..255
    c: Int as int8;      // -128..127
    d: Int as uint32;    // 0..4 billion

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}