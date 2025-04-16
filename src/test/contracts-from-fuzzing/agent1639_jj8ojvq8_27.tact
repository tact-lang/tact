contract DiffOrderTest {
    a: Int as uint8;
    b: Int;
    c: Int as int16;
    d: Int;

    init() {
        self.a = 255;
        self.b = -5;
        self.c = 30000;
        self.d = 77;
    }
}
