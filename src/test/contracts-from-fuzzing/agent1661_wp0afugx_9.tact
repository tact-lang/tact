contract SerialOrder {
    a: Int as uint1;  // occupies 1 bit
    b: Int;          // occupies 257 bits
    c: Int as int4;  // occupies 4 bits
    d: Int as uint32; // 32 bits

    init() {
        self.a = 1;
        self.b = 42;
        self.c = -3;
        self.d = 1000;
    }
}