contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.a = 42;
        self.b = -1234;
        self.c = ton("1");
    }
}