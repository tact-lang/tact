contract SerializeInts {
    a: Int as uint8 = 0;
    b: Int as uint16 = 0;
    c: Int as int32 = 0;
    init() {
        self.a = 255;
        self.b = 65535;
        self.c = -2147483648;
    }
    receive() {}
}