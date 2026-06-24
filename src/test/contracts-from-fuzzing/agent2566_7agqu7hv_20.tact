contract IntSerializationTest {
    a: Int as uint8;     // 0..255
    b: Int as int16;     // -32768..32767
    c: Int as uint64;    // 0..2^64-1
    d: Int;              // 257-bit default

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 1234567890123456789;
        self.d = -1;
    }
}
