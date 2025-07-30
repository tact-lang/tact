contract NestedSerializations {
    a: Int as uint8;
    b: Int as int256;
    c: Int;
    d: Int as coins;

    init() {
        self.a = 127;
        self.b = -123456789;
        self.c = 987654321;
        self.d = 1000000;
    }
}