contract Test13 {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;

    init() {
        self.a = 255;
        self.b = -1000;
        self.c = 1000000;
    }
}