contract NestedUnits {
    a: Int as int32;
    b: Int as int64;
    c: Int as uint8;
    d: Int as coins;

    init() {
        self.a = -123456;
        self.b = 1234567890123;
        self.c = 255;
        self.d = 5000000000; // 5 TON
    }
}