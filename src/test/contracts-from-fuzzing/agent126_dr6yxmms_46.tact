contract MultiSerializationLimits {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int8;

    init() {
        self.a = 31;   // overflow
        self.b = 300;  // overflow
        self.c = -200; // overflow
    }
}