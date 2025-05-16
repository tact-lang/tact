contract TestContract {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;

    init() {
        self.a = 10;
        self.b = -100;
        self.c = ton("1");
    }
}