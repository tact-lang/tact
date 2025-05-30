contract FieldOrdering {
    a: Int;
    b: Int as uint8;
    c: Int as int1;
    d: Int as uint256;
    e: Bool;
    f: String;

    init() {
        self.a = 100;
        self.b = 5;
        self.c = -1;
        self.d = 999999;
        self.e = true;
        self.f = "test";
    }
}
