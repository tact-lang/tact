contract FieldsWithSerializations {
    a: Int as int16;
    b: Int as uint4;
    c: Int as coins;
    d: Int; // full 257 bits

    init() {
        self.a = -123;
        self.b = 12;
        self.c = 777777777;
        self.d = 123456789012345678901;
    }
}