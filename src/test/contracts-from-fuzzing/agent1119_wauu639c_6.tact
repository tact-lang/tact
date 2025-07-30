contract SerializeTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
    e: Int; // default int257

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 1234567890123;
        self.d = -1;
        self.e = 42;
    }
}