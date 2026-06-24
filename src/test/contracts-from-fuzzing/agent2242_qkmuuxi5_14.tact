contract FieldOrdering {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint256;
    e: Bool;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -1000;
        self.d = 12345678901234567890;
        self.e = true;
    }
}