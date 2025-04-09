contract Test40 {
    a: Int as uint8 = 42;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.b = -1000;
        self.c = 1000000;
    }
}