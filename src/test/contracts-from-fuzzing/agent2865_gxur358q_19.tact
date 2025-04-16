contract MaxIntWidths {
    a: Int as int257;
    b: Int as uint256;
    c: Int as int1;
    d: Int as uint1;

    init() {
        self.a = -1;
        self.b = 1;
        self.c = -1;
        self.d = 1;
    }
}