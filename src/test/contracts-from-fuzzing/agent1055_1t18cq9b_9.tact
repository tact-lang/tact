contract VarIntWidths {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint128;
    d: Int as int256;

    init() {
        self.a = 5;
        self.b = -8;
        self.c = 1000000000;
        self.d = -1000000000;
    }
}