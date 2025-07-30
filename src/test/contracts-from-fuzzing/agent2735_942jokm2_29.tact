contract PersistSpecial {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Int as int257;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = ton("1");
        self.d = 42;
    }
}
