contract WeirdOrder {
    a: Int as int8;
    b: Int;
    c: Int?;
    d: Int as uint256;
    e: Int?;

    init() {
        self.a = 3;
        self.b = 4;
        self.c = 5;
        self.d = 6;
        self.e = null;
    }
}