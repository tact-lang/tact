contract Test43 {
    a: Int as coins;
    b: Int as uint64;

    init() {
        self.a = ton("1");
        self.b = 1234;
    }
}