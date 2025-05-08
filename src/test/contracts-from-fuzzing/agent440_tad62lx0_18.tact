contract TestContract {
    a: Int as int64;
    b: Int as uint8;
    c: Int as coins;

    init() {
        self.a = 123456789;
        self.b = 42;
        self.c = 1000;
    }
}