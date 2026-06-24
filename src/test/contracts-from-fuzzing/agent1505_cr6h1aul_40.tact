contract MultiAscribed {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;

    init() {
        self.a = 123456789012345;
        self.b = 1234567890;
        self.c = ton("1");
    }
}