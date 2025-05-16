contract PrimitiveOverflow {
    a: Int as uint4;  // 0..15
    b: Int as int8;  // -128..127
    c: Int as uint16; // 0..65535

    init() {
        self.a = 15;
        self.b = -128;
        self.c = 65535;
    }
}