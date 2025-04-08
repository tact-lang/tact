contract Test {
    a: Int;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint256;

    init() {
        self.a = -1;
        self.b = 0;
        self.c = 0;
        self.d = 0;
    }
}