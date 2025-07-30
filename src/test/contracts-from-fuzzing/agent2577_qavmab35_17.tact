contract SerialTest {
    a: Int as coins;
    b: Int as int64;
    c: Int as uint8;

    init() {
        self.a = ton("1.5");
        self.b = -1000;
        self.c = 200;
    }
}
