contract Test15 {
    a: Int as int64 = 0;
    b: Int as uint64 = 1;
    c: Int as int8 = -1;
    d: Int as uint8 = 255;

    init() {
        self.a = -64;
        self.b = 64;
        self.c = -8;
        self.d = 8;
    }
}