contract ManyFieldsSerialization {
    f1: Int as uint3;   // 3 bits
    f2: Int as uint5;   // 5 bits
    f3: Int as int10;   // 10 bits
    f4: Int as uint64;  // 64 bits
    f5: Int as int8;    // 8 bits
    f6: Int as uint16;  // 16 bits

    init() {
        self.f1 = 7;
        self.f2 = 31;
        self.f3 = -512;
        self.f4 = 123456789;
        self.f5 = -128;
        self.f6 = 65535;
    }
}