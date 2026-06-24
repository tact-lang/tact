contract SerialTest {
    a: Int as int64;
    b: Int as uint64;
    c: Int as coins;
    d: Int as int8;
    e: Int as uint8;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
        self.d = 5;
        self.e = 250;
    }
}