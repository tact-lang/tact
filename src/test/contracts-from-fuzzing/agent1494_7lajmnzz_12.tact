contract SerializedTest {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;

    init() {
        self.a = 5;
        self.b = -10;
        self.c = 0;
    }
}