contract FieldOrder {
    a: Int as uint8 = 1;
    b: Int = 123456789;
    c: Int as int16 = -32;
    d: Int as uint4 = 15;
    e: Int as int257 = 42;

    init() {
        self.a = 5;
        self.b = 6;
        self.c = 7;
        self.d = 8;
        self.e = 9;
    }
}