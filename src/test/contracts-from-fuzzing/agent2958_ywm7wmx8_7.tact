contract Test {
    a: Int as uint4;
    b: Int as int1;
    c: Int as uint8;
    d: Int as int257;

    init() {
        self.a = 7;
        self.b = -1;
        self.c = 255;
        self.d = 0;
    }
}