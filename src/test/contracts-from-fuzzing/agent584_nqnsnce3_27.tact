contract Test {
    a: Int as uint8;
    b: Int as int4;

    init() {
        self.a = 256; // overflow
        self.b = -16; // in range (signed -8 to 7), but set to min
        self.a = 42;  // in range
        self.b = 3;   // in range
    }
}