contract SerialOrderTest {
    a: Int as uint8; // 8 bits
    b: Int as uint16; // 16 bits
    c: Int as int32;  // 32 bits
    d: Int as uint64; // 64 bits
    e: Int;           // 257 bits

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }

    receive() {}
}